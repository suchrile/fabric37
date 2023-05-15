import type { Info } from "@/interfaces";

export const useInfo = () =>
  useState<Info>("info", () => ({
    app: {
      name: "",
      description: "",
      keywords: "",
    },
    contacts: {
      email: "",
      phoneNumbers: [],
      address: "",
    },
  }));
