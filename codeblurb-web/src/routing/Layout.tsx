import NavigationBar from "@/components/NavigationBar";
import { FC } from "react";
import { Outlet } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import Footer from "./Footer";

const Layout: FC = () => {
  return (
    <>
      <div style={{ minHeight: "calc(100vh - 56px)" }}>
        <NavigationBar />
        <div className="font-roboto container mx-auto my-8 max-w-5xl grow px-4">
          <Outlet />
        </div>
      </div>
      <Footer />
      <ToastContainer
        position="bottom-center"
        autoClose={2000}
        closeOnClick
        hideProgressBar
        pauseOnHover={false}
        className="w-64"
        draggable
      />
    </>
  );
};

export default Layout;
