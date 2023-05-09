export type TNonFunctionKeys<T> = {
  [K in keyof T]: T[K] extends Function ? never : K;
}[keyof T];

export type TArrayKeys<T> = {
  [K in keyof T]: T[K] extends Array<any> ? K : never;
}[keyof T];

export type TObjectKeys<T> = {
  [K in keyof T]: T[K] extends Object ? K : never;
}[keyof T];
