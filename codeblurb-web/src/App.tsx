import { FC } from "react";
import { Route, Routes } from "react-router-dom";
import LoginPage from "./components/login/LoginPage";
import Layout from "./routing/Layout";
import RequireAuth from "./routing/RequireAuth";

const App: FC = () => {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route path="/" element={<div>Landing page</div>} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/register" element={<div>Sign up page</div>} />
        <Route element={<RequireAuth />}>
          <Route path="/home" element={<div>Home page</div>} />
          <Route path="/explore" element={<div>explore page</div>} />
          <Route path="/my-courses" element={<div>my-courses page</div>} />
          <Route
            path="/shopping-cart"
            element={<div>shopping-cart page</div>}
          />
          <Route path="/profile" element={<div>Profile page</div>} />
        </Route>
      </Route>
    </Routes>
  );
};

export default App;
