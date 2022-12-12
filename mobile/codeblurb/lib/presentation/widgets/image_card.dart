import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/presentation/widgets/activity_indicator.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
  });

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        margin: EdgeInsets.zero,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Image(
          image: image,
          fit: BoxFit.fill,
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return Container(
                foregroundDecoration: BoxDecoration(
                    gradient: RadialGradient(radius: 0.95, colors: [
                  Colors.transparent,
                  Colors.transparent,
                  AppColors.baseDarkGrey.withOpacity(0.75),
                ])),
                child: child,
              );
            } else {
              return Container(
                  alignment: const Alignment(0, 0),
                  constraints: const BoxConstraints.expand(),
                  child: const ActivityIndicator(isLight: true));
            }
          },
        ),
      ),
    );
  }
}
