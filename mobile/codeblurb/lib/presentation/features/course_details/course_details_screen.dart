import 'package:codeblurb/presentation/features/course_details/components/buy_course_section.dart';
import 'package:codeblurb/presentation/features/course_details/components/course_creation_section.dart';
import 'package:codeblurb/presentation/features/course_details/components/curriculum_section.dart';
import 'package:codeblurb/presentation/features/course_details/components/rating_section.dart';
import 'package:codeblurb/presentation/widgets/image_card.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ImageCard(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Ss3LmcZNyQpID0amZAhilwL35psjlUs1j_Xmhr2pis1rdLr0yRL3AgAkWUMhwj1vdf0&usqp=CAU',
                ),
                width: double.infinity,
              ),
              const SizedBox(height: 15),
              const Text(
                "Flutter bloc course from novice to expert uramatyam mennyi szoveg",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter bloc course subtitle that proves this course contains every bit of information you could ever need, also the underlyi ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 15),
              const RatingSection(
                rating: 4.69796,
                raterCount: 123,
                totalStudentCount: 23522,
              ),
              const SizedBox(height: 10),
              CourseCreationSection(
                creatorName: 'Denis Panjuta',
                lastUpdated: DateTime.now(),
              ),
              const SizedBox(height: 25),
              const BuyCourseSection(
                originalPrice: 9.99,
                daysLeftOfOffer: 3,
                discountedPrice: 5.99,
              ),
              const SizedBox(height: 20),
              CurriculumSection(),
            ],
          ),
        ),
      ),
    );
  }
}
