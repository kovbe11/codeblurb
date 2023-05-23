import axiosClient from "@/network/axiosClient";
import { TTokens } from "@/utils/types";
import { useMutation } from "@tanstack/react-query";
import { useCallback } from "react";
import useTokenStore from "../store/token";

export const useLogin = (onError: () => void) => {
  const setAccessToken = useTokenStore(
    useCallback((state) => state.setAccessToken, [])
  );
  const setRefreshToken = useTokenStore(
    useCallback((state) => state.setRefreshToken, [])
  );

  const { mutateAsync: login, isLoading } = useMutation({
    mutationKey: [`login`],
    mutationFn: async (data: { username: string; password: string }) => {
      return await axiosClient.post<TTokens>("/auth/login", data);
    },
    meta: {
      showToast: false,
    },
    onSuccess: (data) => {
      setAccessToken(data.data.accessToken);
      setRefreshToken(data.data.refreshToken);
    },
    onError,
  });

  return { login, isLoading };
};
