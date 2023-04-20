import useAuth from "@/hooks/useAuth";
import { FC, memo } from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";

// const RequireAuth: FC<PropsWithChildren> = ({ children }) => {
const RequireAuth: FC = () => {
  const { isLoggedIn } = useAuth();
  const location = useLocation();

  if (!isLoggedIn) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }
  // return <>{children}</>;
  return <Outlet />;
};

export default memo(RequireAuth);
