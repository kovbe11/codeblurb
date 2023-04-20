import { useCallback } from "react";
import { useLocalStorage } from "react-use";
import { LoginResponse } from "./../network/models/loginResponse";

const useAuth = () => {
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
    logout();
  }, []);

  const login = useCallback((tokens: LoginResponse) => {
    setRefreshToken(tokens.accessToken);
    setAccessToken(tokens.refreshToken);
  }, []);

  return {
    isLoggedIn: !!accessToken,
    login,
    logout,
    tokens: { accessToken, refresh: refreshToken },
  };
};

export default useAuth;
