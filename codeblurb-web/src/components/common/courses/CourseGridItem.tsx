import { TCourseInfo } from "@/utils/types";
import { faShoppingBasket } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { FC } from "react";
import ProgressBar from "../ProgressBar";

const CourseGridItem: FC<{
  course: Omit<TCourseInfo, "price"> &
    (
      | {
          price: number;
        }
      | {
          progress: number;
        }
    );
}> = ({ course }) => {
  return "progress" in course ? (
    <div className="flex h-[136] flex-shrink-0 flex-col justify-between rounded-sm bg-gray-100 transition-all duration-200 hover:bg-gray-200 hover:shadow-lg">
      <div className="flex h-[132px] gap-3 p-3">
        <img
          src={course.image}
          alt={course.title}
          className="h-28 w-28 rounded-sm object-cover"
        />
        <div className="flex flex-col justify-between">
          <h3 className="text-base font-bold">{course.title}</h3>
          <div className="flex justify-between">
            <p className="text-sm text-gray-500">{course.technology}</p>
            <p className="text-sm text-gray-500">{course.rating}</p>
            {/* Add better rating design */}
          </div>
        </div>
      </div>
      <ProgressBar progress={course.progress} />
    </div>
  ) : (
    <div className="flex flex-shrink-0 flex-col gap-2 rounded-md p-3 transition-all duration-200 hover:bg-gray-100 hover:shadow-md">
      <div className="relative h-40">
        <img
          src={course.image}
          alt={course.title}
          className="h-full w-full rounded-md object-cover drop-shadow-lg"
        />
        <FontAwesomeIcon
          icon={faShoppingBasket}
          className="absolute bottom-2 right-2 h-6 w-6 cursor-pointer rounded-sm border border-black bg-white p-1 shadow-lg transition-all duration-200 hover:bg-gray-200"
        />
      </div>

      <h3 className="text-base font-bold">{course.title}</h3>
      <div className="flex justify-between">
        <p className="text-xs text-gray-500">{course.rating}</p>
        <p className="text-xs text-gray-500">{course.technology}</p>
        {/* Add better rating design */}
      </div>
    </div>
  );
};

export default CourseGridItem;
