import { queryClient } from "@/queryClient";
import jwt_decode from "jwt-decode";
import { create } from "zustand";
import { devtools, persist } from "zustand/middleware";
import { immer } from "zustand/middleware/immer";

type TState = {
  access: string | null;
  refresh: string | null;
  userId: number | null;
  username: string | null;
  setAccessToken: (token: string | null) => void;
  setRefreshToken: (token: string | null) => void;
  reset(): void;
  logout(): void;
};

const initialState = {
  access: null,
  refresh: null,
  userId: null,
  username: null,
};

export const useTokenStore = create<TState>()(
  persist(
    devtools(
      immer((set, get) => ({
        ...initialState,
        setAccessToken: (accessToken) => {
          const decodedToken = jwt_decode(accessToken ?? "");
          set(
            (state) => {
              state.access = accessToken;
              if (
                decodedToken &&
                typeof decodedToken === "object" &&
                "customerId" in decodedToken &&
                decodedToken.customerId &&
                typeof decodedToken.customerId === "number"
              )
                state.userId = decodedToken.customerId;

              if (
                decodedToken &&
                typeof decodedToken === "object" &&
                "aud" in decodedToken &&
                decodedToken.aud &&
                typeof decodedToken.aud === "string"
              )
                state.username = decodedToken.aud;
            },
            false,
            "useTokenStore/setAccessToken"
          );
        },
        setRefreshToken: (refreshToken) =>
          set(
            (state) => {
              state.refresh = refreshToken;
            },
            false,
            "useTokenStore/setRefreshToken"
          ),
        logout: () => {
          get().reset();
          queryClient.clear();
        },

        reset: () => {
          set((_) => initialState, false, "useTokenStore/reset");
          localStorage.removeItem("token-storage");
        },
      })),
      { name: "Token Store" }
    ),
    {
      name: "token-store",
    }
  )
);

export default useTokenStore;
