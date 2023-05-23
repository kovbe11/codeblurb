import LandingPage from "@/components/landing/LandingPage";
import SignUpPage from "@/components/signUp/SignUpPage";
import { FC } from "react";
import { Route, Routes } from "react-router-dom";
import "react-toastify/dist/ReactToastify.css";
import "swiper/css";
import "swiper/css/autoplay";
import {
  default as CourseDetailsPage,
  default as CourseTaskPage,
} from "./components/courseDetails/CourseDetailsPage";
import ExplorePage from "./components/explore/ExplorePage";
import HomePage from "./components/home/HomePage";
import LoginPage from "./components/login/LoginPage";
import MyCoursesPage from "./components/myCourses/MyCoursesPage";
import ProfilePage from "./components/profile/ProfilePage";
import ShoppingCartPage from "./components/shoppingCart/ShoppingCartPage";
import Layout from "./routing/Layout";
import RedirectIfLoggedIn from "./routing/RedirectIfLoggedIn";
import RequireAuth from "./routing/RequireAuth";

const App: FC = () => {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route path="/" element={<LandingPage />} />
        <Route element={<RedirectIfLoggedIn />}>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/register" element={<SignUpPage />} />
        </Route>

        <Route element={<RequireAuth />}>
          <Route path="/home" element={<HomePage />} />
          <Route path="/explore" element={<ExplorePage />} />
          <Route path="/my-courses" element={<MyCoursesPage />} />
          <Route path="/shopping-cart" element={<ShoppingCartPage />} />
          <Route path="/profile" element={<ProfilePage />} />
          <Route path="/course/:courseId" element={<CourseDetailsPage />} />
          <Route
            path="/course/:courseId/task/:taskId"
            element={<CourseTaskPage />}
          />
        </Route>
      </Route>
    </Routes>
  );
};

export default App;
