export type TNonFunctionKeys<T> = {
  [K in keyof T]: T[K] extends Function ? never : K;
}[keyof T];

export type TArrayKeys<T> = {
  [K in keyof T]: T[K] extends Array<any> ? K : never;
}[keyof T];

export type TObjectKeys<T> = {
  [K in keyof T]: T[K] extends Object ? K : never;
}[keyof T];

export type TInformationType = "info" | "danger" | "warning" | "success";

export type THelp = {
  type: TInformationType;
  message: string;
};

export type TDraggableCategory = "all" | "solution";

export type TTokens = {
  accessToken: string;
  refreshToken: string;
};

export type TCourseInfo = {
  id: number;
  title: string;
  technology: string;
  rating: number;
  image: string;
  price: number;
};
