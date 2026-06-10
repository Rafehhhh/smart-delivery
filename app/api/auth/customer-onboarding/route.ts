import { z } from "zod";
import { fail, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";

const customerOnboardingSchema = z.object({
  fullName: z.string().min(2),
  phone: z.string().min(8),
  houseName: z.string().min(1),
  addressLine: z.string().min(4),
  locality: z.string().min(2),
  landmark: z.string().optional(),
  next: z.string().optional()
});

export async function POST(request: Request) {
  const parsed = await parseJson(request, customerOnboardingSchema);
  if (!parsed.success) return fail("Invalid customer details.", 422, parsed.error.flatten());

  const supabase = await createSupabaseServerClient();
  const userResult = await supabase.auth.getUser();
  const user = userResult.data.user;
  if (!user) return fail("Sign in before saving customer details.", 401);

  const profileResult = await supabase.from("profiles").upsert({
    id: user.id,
    role: "customer",
    full_name: parsed.data.fullName,
    phone: parsed.data.phone,
    updated_at: new Date().toISOString()
  }).select("id").single();

  if (profileResult.error) return fail("Could not save customer profile.", 500, profileResult.error.message);

  const existingAddress = await supabase
    .from("customer_addresses")
    .select("id")
    .eq("customer_id", user.id)
    .eq("is_default", true)
    .maybeSingle();

  const addressPayload = {
    customer_id: user.id,
    house_name: parsed.data.houseName,
    address_line: parsed.data.addressLine,
    landmark: parsed.data.landmark || null,
    locality: parsed.data.locality,
    is_default: true
  };

  const addressResult = existingAddress.data
    ? await supabase.from("customer_addresses").update(addressPayload).eq("id", existingAddress.data.id).select("id").single()
    : await supabase.from("customer_addresses").insert(addressPayload).select("id").single();

  if (addressResult.error) return fail("Could not save customer address.", 500, addressResult.error.message);

  return ok({ profileId: user.id, addressId: addressResult.data.id });
}
