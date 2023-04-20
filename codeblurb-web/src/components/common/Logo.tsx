import { FC } from "react";
import { Link } from "react-router-dom";
import Icon from "./Icon";

import LogoSrc from "@/assets/react.svg";

const Logo: FC = () => {
  return (
    <Link to="/login">
      <Icon src={LogoSrc} />
    </Link>
  );
};

export default Logo;

// import { FC } from "react"

// const NavigationBar: FC = () => {
//     return <div className=""></div>
// }

// export default NavigationBar
