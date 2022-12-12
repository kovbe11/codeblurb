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
            children: const [
              ImageCard(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Ss3LmcZNyQpID0amZAhilwL35psjlUs1j_Xmhr2pis1rdLr0yRL3AgAkWUMhwj1vdf0&usqp=CAU',
                ),
                width: double.infinity,
              ),
              SizedBox(height: 15),
              Text(
                "Flutter bloc course from novice to expert uramatyam mennyi szoveg",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Flutter bloc course subtitle that proves this course contains every bit of information you could ever need, also the underlyi ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              RatingSection(rating: 4.6),
              Text("course creation info come here"),
              Text('BUY THIS COURSE !!!!!'),
              Text("curriculum from where you can get to the coding exercises"),
            ],
          ),
        ),
      ),
    );
  }
}
