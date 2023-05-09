import useAuth from "@/hooks/useAuth";
import client from "@/network/axiosClient";
import { LoginResponse } from "@/network/models/loginResponse";
import { useMutation } from "@tanstack/react-query";
import { FC } from "react";
import Loader from "../common/Loader";

const LoginPage: FC = () => {
  const { login: saveTokens } = useAuth();
  const { mutate: login, isLoading } = useMutation({
    mutationKey: [`/login/`],
    mutationFn: async () => {
      const response = await client.post<LoginResponse>("/auth/register/", {
        username: "admin",
        password: "admin",
      });
      // saveTokens(response.data);
      // saveTokens({
      //   accessToken:
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJ1c2VySWQiOjEsImV4cCI6MTY5OTk5OTk5OX0.apqA1rdc_A41nHHVfKUjqJ9QjSZrDGFRPZMrv2l-rdw",
      //   refreshToken:
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJ1c2VySWQiOjEsImV4cCI6MTY5OTk5OTk5OX0.apqA1rdc_A41nHHVfKUjqJ9QjSZrDGFRPZMrv2l-rdw",
      // });
    },
    onError: (error) => {
      //TODO remove following
      saveTokens({
        accessToken:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJ1c2VySWQiOjEsImV4cCI6MTY5OTk5OTk5OX0.apqA1rdc_A41nHHVfKUjqJ9QjSZrDGFRPZMrv2l-rdw",
        refreshToken:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJ1c2VySWQiOjEsImV4cCI6MTY5OTk5OTk5OX0.apqA1rdc_A41nHHVfKUjqJ9QjSZrDGFRPZMrv2l-rdw",
      });
    },
  });

  return (
    <div className="flex flex-grow items-center justify-center gap-10">
      <p>Login Page</p>
      <button
        type="button"
        className="flex items-center justify-center rounded-lg bg-blue-500 px-5 py-3 text-white"
        onClick={() => login()}
      >
        {isLoading ? <Loader /> : <p>Log In</p>}
      </button>
    </div>
  );
};

export default LoginPage;
