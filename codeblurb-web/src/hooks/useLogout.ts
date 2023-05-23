import axiosClient from "@/network/axiosClient";
import { useMutation } from "@tanstack/react-query";
import { AxiosAuthRefreshRequestConfig } from "axios-auth-refresh";
import { useCallback } from "react";
import { useNavigate } from "react-router-dom";
import useTokenStore from "../store/token";

export const useLogout = () => {
  const logout = useTokenStore(useCallback((state) => state.logout, []));
  const accessToken = useTokenStore(useCallback((state) => state.access, []));
  const navigate = useNavigate();
  const { mutate } = useMutation({
    mutationKey: [`logout`, accessToken],
    mutationFn: async () => {
      if (!accessToken) return;
      axiosClient.post("/auth/logout", undefined, {
        skipAuthRefresh: true,
      } as AxiosAuthRefreshRequestConfig);
    },
    meta: {
      showToast: false,
    },
    onSettled: () => {
      logout();
      navigate("/", { state: { from: "" } });
    },
  });

  return mutate;
};
