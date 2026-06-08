import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Smart Delivery",
  description: "Local smart delivery service for household purchase orders."
};

export default function RootLayout({
  children
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
