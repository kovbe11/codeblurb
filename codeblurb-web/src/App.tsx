import { FC } from "react";
import { useTranslation } from "react-i18next";

const App: FC = () => {
  const { t } = useTranslation();
  return (
    <div className="flex h-full w-full items-center justify-center bg-red-500">
      {t("hello")}
    </div>
  );
};

export default App;
