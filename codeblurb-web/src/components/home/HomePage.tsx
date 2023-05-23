import { TCourseInfo } from "@/utils/types";
import _ from "lodash";
import { FC } from "react";
import CourseList from "../common/courses/CourseList";

const HomePage: FC = () => {
  return (
    <div className="flex flex-col gap-4">
      <CourseList
        courses={startedCourses.map((c) => ({ ...c, progress: 0.5 }))}
        title="Continue Where You Left Off"
        className="pb-6"
      />
      <CourseList
        courses={_.shuffle(startedCourses)}
        title="Top Rated Courses"
        slideCount={4}
      />

      <CourseList
        courses={_.shuffle(startedCourses)}
        title="Most Popular"
        slideCount={4}
        autoplay
      />
    </div>
  );
};

export default HomePage;

const startedCourses: TCourseInfo[] = [
  {
    id: 1,
    title: "The Complete Web Development Bootcamp",
    technology: "HTML, CSS, JavaScript",
    rating: 3.8,
    image: "https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg",
    price: 29.99,
  },
  {
    id: 2,
    title: "Algorithms And Data Structures With Python",
    technology: "Python",
    rating: 4.5,
    image:
      "https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1",
    price: 9.99,
  },
  {
    id: 3,
    title: "That Weird Javascript Course",
    technology: "JavaScript",
    rating: 3.2,
    image: "https://fireship.io/courses/js/img/featured.webp",
    price: 9.99,
  },
  {
    id: 4,
    title: "Kotlin In a nutshell",
    technology: "Kotlin",
    rating: 4.1,
    image: "https://kotlinlang.org/assets/images/twitter/general.png",
    price: 9.99,
  },
  {
    id: 5,
    title: "Build Modern Web Applications With SvelteKit",
    technology: "JavaScript, Svelte",
    rating: 4.7,
    image:
      "https://www.freecodecamp.org/news/content/images/2022/10/svelte-1.png",
    price: 9.99,
  },
  {
    id: 6,
    title: "State Management With Flutter Riverpod",
    technology: "Dart, Flutter",
    rating: 3.9,
    image:
      "https://fireship.io/lessons/firebase-riverpod-flutter/img/featured.png",
    price: 9.99,
  },
  {
    id: 7,
    title: "Flutter BloC - The Course",
    technology: "Dart, Flutter",
    rating: 4.2,
    image: "https://i.ytimg.com/vi/oxeYeMHVLII/maxresdefault.jpg",
    price: 9.99,
  },
  {
    id: 8,
    title: "The Complete Web Development Bootcamp",
    technology: "HTML, CSS, JavaScript",
    rating: 4.6,
    image: "https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg",
    price: 29.99,
  },
  {
    id: 9,
    title: "Algorithms And Data Structures With Python",
    technology: "Python",
    rating: 3.7,
    image:
      "https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1",
    price: 9.99,
  },
  {
    id: 10,
    title: "That Weird Javascript Course",
    technology: "JavaScript",
    rating: 4.0,
    image: "https://fireship.io/courses/js/img/featured.webp",
    price: 9.99,
  },
  {
    id: 11,
    title: "Kotlin Crash Course",
    technology: "Kotlin",
    rating: 4.2,
    image: "https://kotlinlang.org/assets/images/twitter/general.png",
    price: 19.99,
  },
  {
    id: 12,
    title: "Intro to React.js",
    technology: "JavaScript, React",
    rating: 4.8,
    image:
      "https://www.freecodecamp.org/news/content/images/2022/10/svelte-1.png",
    price: 14.99,
  },
  {
    id: 13,
    title: "Advanced Data Structures and Algorithms",
    technology: "Python",
    rating: 4.5,
    image:
      "https://fireship.io/lessons/firebase-riverpod-flutter/img/featured.png",
    price: 19.99,
  },
  {
    id: 14,
    title: "Building Mobile Apps with Flutter",
    technology: "Dart, Flutter",
    rating: 4.3,
    image: "https://i.ytimg.com/vi/oxeYeMHVLII/maxresdefault.jpg",
    price: 24.99,
  },
  {
    id: 15,
    title: "Responsive Web Design",
    technology: "HTML, CSS",
    rating: 4.1,
    image: "https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg",
    price: 14.99,
  },
  {
    id: 16,
    title: "Python Web Development",
    technology: "Python, Django",
    rating: 4.6,
    image:
      "https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1",
    price: 19.99,
  },
  {
    id: 17,
    title: "Full Stack JavaScript Development",
    technology: "JavaScript, Node.js, Express",
    rating: 4.4,
    image: "https://fireship.io/courses/js/img/featured.webp",
    price: 24.99,
  },
  {
    id: 18,
    title: "Rust Programming Masterclass",
    technology: "Rust",
    rating: 4.2,
    image: "https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg",
    price: 19.99,
  },
  {
    id: 19,
    title: "C++ Fundamentals",
    technology: "C++",
    rating: 3.9,
    image:
      "https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1",
    price: 14.99,
  },
  {
    id: 20,
    title: "Kubernetes in Action",
    technology: "Kubernetes",
    rating: 4.5,
    image: "https://fireship.io/courses/js/img/featured.webp",
    price: 24.99,
  },
  {
    id: 21,
    title: "AWS Certified Solutions Architect",
    technology: "AWS",
    rating: 4.6,
    image: "https://kotlinlang.org/assets/images/twitter/general.png",
    price: 29.99,
  },
  {
    id: 22,
    title: "Web Hosting Mastery",
    technology: "Web Hosting",
    rating: 4.0,
    image:
      "https://www.freecodecamp.org/news/content/images/2022/10/svelte-1.png",
    price: 9.99,
  },
  {
    id: 23,
    title: "Git Version Control",
    technology: "Git",
    rating: 4.3,
    image:
      "https://fireship.io/lessons/firebase-riverpod-flutter/img/featured.png",
    price: 14.99,
  },
  {
    id: 24,
    title: "Machine Learning with Python",
    technology: "Python, Machine Learning",
    rating: 4.8,
    image: "https://i.ytimg.com/vi/oxeYeMHVLII/maxresdefault.jpg",
    price: 24.99,
  },
  {
    id: 25,
    title: "Data Science Fundamentals",
    technology: "Python, Data Science",
    rating: 4.1,
    image: "https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg",
    price: 19.99,
  },
  {
    id: 26,
    title: "Android App Development",
    technology: "Java, Android",
    rating: 4.4,
    image:
      "https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1",
    price: 29.99,
  },
  {
    id: 27,
    title: "DevOps with Docker",
    technology: "Docker, DevOps",
    rating: 4.6,
    image: "https://fireship.io/courses/js/img/featured.webp",
    price: 24.99,
  },
];
