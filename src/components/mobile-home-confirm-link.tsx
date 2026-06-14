"use client";

import { type ReactNode, useState } from "react";

export function MobileHomeConfirmLink({
  children,
  className,
  title = "Home",
  href = "/"
}: {
  children: ReactNode;
  className: string;
  title?: string;
  href?: string;
}) {
  const [isOpen, setIsOpen] = useState(false);

  function handleClick() {
    if (window.matchMedia("(min-width: 1024px)").matches) {
      window.location.href = href;
      return;
    }
    setIsOpen(true);
  }

  return (
    <>
      <button type="button" onClick={handleClick} className={className} aria-label="Go to home" title={title}>
        {children}
      </button>
      {isOpen ? (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-ink/25 px-4 lg:hidden" onClick={() => setIsOpen(false)}>
          <section
            className="w-full max-w-[280px] rounded-3xl border border-ink/30 bg-white p-4 text-center shadow-soft"
            onClick={(event) => event.stopPropagation()}
          >
            <h2 className="text-lg font-semibold">Go to home page?</h2>
            <div className="mt-4 grid grid-cols-2 gap-2">
              <button
                type="button"
                onClick={() => setIsOpen(false)}
                className="focus-ring rounded-full border border-ink/25 bg-white px-4 py-2 text-sm font-semibold text-ink"
              >
                No
              </button>
              <button
                type="button"
                onClick={() => {
                  window.location.href = href;
                }}
                className="focus-ring rounded-full border border-ink bg-ink px-4 py-2 text-sm font-semibold text-white"
              >
                Yes
              </button>
            </div>
          </section>
        </div>
      ) : null}
    </>
  );
}
