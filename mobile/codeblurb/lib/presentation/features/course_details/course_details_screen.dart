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
                    'https://fireship.io/courses/javascript/img/featured.png'),
                width: double.infinity,
              ),
              const SizedBox(height: 15),
              const Text(
                "That Weird JavaScript Course",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'That Weird JavaScript Course takes a unique approach. Not only will you learn practical techniques for building apps, but you will also gain knowledge about the world’s most widely-used programming language. My mission is to make you a well-rounded JavaScript and NodeJs developer.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 15),
              const RatingSection(
                rating: 4.99796,
                raterCount: 123,
                totalStudentCount: 23522,
              ),
              const SizedBox(height: 10),
              CourseCreationSection(
                creatorName: 'Jeff Delaney',
                lastUpdated: DateTime.now(),
              ),
              const SizedBox(height: 25),
              const BuyCourseSection(
                originalPrice: 119.99,
                daysLeftOfOffer: 3,
                discountedPrice: 59.99,
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
