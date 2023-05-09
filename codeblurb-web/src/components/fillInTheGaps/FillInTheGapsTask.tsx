import { FC } from "react";

const FillInTheGapsTask: FC<{ textParts: string[] }> = ({ textParts }) => {
  return (
    <div className="wrap flex w-full flex-wrap items-center justify-start gap-2">
      {textParts.map((text, index) => (
        <>
          <span className="text-base">{text}</span>
          {index !== textParts.length - 1 && (
            <input className="inline-block h-7 w-24 rounded-md border  border-gray-600 p-2 focus:border-blue-500"></input>
          )}
        </>
      ))}
    </div>
  );
};

export default FillInTheGapsTask;
