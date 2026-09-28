export interface DesignFilters { forms: string[]; styles: string[] }
export interface DesignCase {
  id: string; title: string; description: string; cover: string | null;
  form: string | null; style: string | null;
}
export interface DesignCasePage {
  items: DesignCase[]; total: number; page: number; pageSize: number; totalPages: number;
}
export interface DesignCaseDetail extends DesignCase {
  images: string[];
  specs: { name: string; value: string }[];
}
