import { FC, memo } from "react";

const ProgressBar: FC<{ progress: number; shouldShowBorder?: boolean }> = ({
  shouldShowBorder = false,
  progress,
}) => {
  return (
    <div
      className={
        "rounded-sm " + (shouldShowBorder ? "border border-blue-900" : "")
      }
    >
      <div
        className="flex h-1 justify-start rounded-sm bg-blue-900"
        style={{ width: `${progress * 100}%` }}
      />
    </div>
  );
};

export default memo(ProgressBar);
