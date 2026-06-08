import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/**/*.{js,ts,jsx,tsx,mdx}"
  ],
  theme: {
    extend: {
      colors: {
        ink: "#17201b",
        leaf: "#1f7a4d",
        mint: "#e5f5eb",
        limewash: "#f7faec",
        market: "#f3b23c",
        clay: "#d9633f",
        cloud: "#f6f7f3"
      },
      boxShadow: {
        soft: "0 18px 50px rgba(23, 32, 27, 0.10)"
      }
    }
  },
  plugins: []
};

export default config;
