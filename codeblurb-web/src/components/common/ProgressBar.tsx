import { FC } from "react";

const ProgressBar: FC<{ progress: number }> = ({ progress }) => {
  return (
    <div
      className="flex h-1 justify-start rounded-sm bg-blue-900"
      style={{ width: `${progress * 100}%` }}
    />
  );
};

export default ProgressBar;
