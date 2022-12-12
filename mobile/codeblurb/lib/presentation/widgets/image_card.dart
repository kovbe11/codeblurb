import 'package:codeblurb/presentation/widgets/activity_indicator.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final double? height;
  final double? width;
  final ImageProvider<Object> image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
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
          fit: fit,
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return Container(
                foregroundDecoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.8,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.45),
                    ],
                  ),
                ),
                child: child,
              );
            } else {
              return Container(
                alignment: const Alignment(0, 0),
                constraints: BoxConstraints.tight(const Size(0, 0)),
                child: const ActivityIndicator(isLight: true),
              );
            }
          },
        ),
      ),
    );
  }
}
