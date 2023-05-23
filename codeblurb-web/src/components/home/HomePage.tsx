import { dummyCourses } from "@/utils/dummyData";
import _ from "lodash";
import { FC } from "react";
import CourseList from "../common/courses/CourseList";

const HomePage: FC = () => {
  return (
    <div className="flex flex-col gap-4">
      <CourseList
        courses={dummyCourses.map((c) => ({ ...c, progress: 0.5 }))}
        title="Continue Where You Left Off"
        className="pb-6"
      />
      <CourseList
        courses={_.shuffle(dummyCourses)}
        title="Top Rated Courses"
        slideCount={4}
      />

      <CourseList
        courses={_.shuffle(dummyCourses)}
        title="Most Popular"
        slideCount={4}
        autoplay
      />
    </div>
  );
};

export default HomePage;
