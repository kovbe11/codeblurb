import axios from "axios";
import dayjs from "dayjs";
import jwt_decode from "jwt-decode";
import { RefreshTokenResponse } from "./models/refreshTokenResponse";

const baseUrl = "https://api.bence.kovacs.host";
const client = axios.create({
  baseURL: baseUrl,
});

client.interceptors.request.use(async (req) => {
  const accessToken = localStorage.getItem("accessToken");
  const refreshToken = localStorage.getItem("refreshToken");

  const isExpired =
    !accessToken ||
    dayjs((jwt_decode(accessToken) as any).exp * 1000).diff(dayjs()) < 1;

  if (!isExpired || !refreshToken) {
    req.headers.Authorization = `Bearer ${accessToken}`;
    return req;
  }

  const response = await axios.post<RefreshTokenResponse>(
    `${baseUrl}/api/token/refresh/`,
    {
      refreshToken,
    }
  );

  localStorage.setItem("accessToken", response.data.accessToken ?? "");
  localStorage.setItem("refreshToken", response.data.refreshToken ?? "");

  req.headers.Authorization = `Bearer ${response.data.accessToken}`;
  return req;
});

export default client;
