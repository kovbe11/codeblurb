import client from "@/network/client";
import { useMutation } from "@tanstack/react-query";
import { FC } from "react";
import { useNavigate } from "react-router-dom";
import Loader from "../common/Loader";

const LoginPage: FC = () => {
  const navigate = useNavigate();

  const { mutate: login, isLoading } = useMutation({
    mutationKey: [`/login/`],
    mutationFn: () =>
      client.post("/auth/login/", {
        username: "admin",
        password: "admin",
      }),
    onSuccess: () => navigate("/home", { replace: true }),
    onError: (error) => console.log(error),
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
