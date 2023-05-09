import { isLoggedInAtom } from "@/store/jotaiAtoms";
import { useSetAtom } from "jotai";
import jwtDecode from "jwt-decode";
import { useCallback, useMemo } from "react";
import { useLocalStorage } from "react-use";
import { LoginResponse } from "./../network/models/loginResponse";

const useAuth = () => {
  const setIsLoggedIn = useSetAtom(isLoggedInAtom);

  const [accessToken, setAccessToken, removeAccessToken] =
    useLocalStorage<string>("accessToken", undefined, {
      raw: true,
    });
  const [refreshToken, setRefreshToken, removeRefreshToken] =
    useLocalStorage<string>("refreshToken", undefined, {
      raw: true,
    });

  const logout = useCallback(() => {
    removeAccessToken();
    removeRefreshToken();
    setIsLoggedIn(false);
  }, []);

  const userId = useMemo(
    () => (accessToken ? (jwtDecode(accessToken) as any).userId : undefined),
    [accessToken]
  );

  const login = useCallback((tokens: LoginResponse) => {
    setIsLoggedIn(true);
    setRefreshToken(tokens.refreshToken);
    setAccessToken(tokens.accessToken);
  }, []);

  return {
    isLoggedIn: !!userId,
    login,
    logout,
    tokens: { accessToken, refresh: refreshToken },
    userId,
  };
};

export default useAuth;
