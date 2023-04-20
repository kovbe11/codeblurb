import useAuth from "@/hooks/useAuth";
import clsxm from "@/utils/clsxm";
import { FC } from "react";
import { NavLink } from "react-router-dom";
import Logo from "./common/Logo";

const NavigationBar: FC = () => {
  const { isLoggedIn } = useAuth();

  return (
    <nav
      role="navigation"
      className="sticky top-0 z-[999] flex h-16 items-center justify-between bg-white px-8 shadow-md"
    >
      <Logo />
      {isLoggedIn ? (
        <div className="flex h-full gap-10">
          <NavLink
            to="/home"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Home
          </NavLink>
          <NavLink
            to="/explore"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Explore
          </NavLink>
          <NavLink
            to="/my-courses"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            My Courses
          </NavLink>
          <NavLink
            to="/shopping-cart"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Cart icon
          </NavLink>
          <NavLink
            to="/profile"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Profile Icon
          </NavLink>
        </div>
      ) : (
        <div className="flex h-full gap-10">
          <NavLink
            to="/login"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Log In
          </NavLink>
          <NavLink
            to="/register"
            className={({ isActive }) =>
              clsxm(
                "flex items-center justify-center transition-all duration-100 hover:scale-105",
                isActive ? "text-blue-500" : "text-black"
              )
            }
          >
            Sign Up
          </NavLink>
        </div>
      )}
    </nav>
  );
};

export default NavigationBar;
