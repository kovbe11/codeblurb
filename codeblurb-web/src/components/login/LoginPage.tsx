import useAuth from "@/hooks/useAuth";
import client from "@/network/axiosClient";
import { LoginResponse } from "@/network/models/loginResponse";
import { useMutation } from "@tanstack/react-query";
import { FC } from "react";
import Loader from "../common/Loader";

const LoginPage: FC = () => {
  const { login: saveTokens } = useAuth();
  const { mutate: login, isLoading } = useMutation({
    mutationKey: [`login`],
    mutationFn: async () => {
      const response = await client.post<LoginResponse>("auth/login", {
        username: "testUser",
        password: "testPassword",
      });
      saveTokens(response.data);
    },
    onError: (error) => {
      console.log(error);
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
