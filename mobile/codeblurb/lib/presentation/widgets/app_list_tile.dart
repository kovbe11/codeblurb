import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

const _cardBorderWidth = 1.0;
const _imageSize = 80.0;

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key,
      this.elevation = 5,
      required this.onTap,
      this.imageUrl,
      required this.cardContent});

  final double elevation;
  final VoidCallback onTap;
  final String? imageUrl;
  final List<Widget> cardContent;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppUIConstants.borderCircular6,
      child: SizedBox(
        height: _imageSize,
        child: ClipRRect(
          borderRadius: AppUIConstants.borderCircular6,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black45,
                border: Border.all(
                  color: Colors.black,
                  width: _cardBorderWidth,
                ),
                borderRadius: AppUIConstants.borderCircular6,
              ),
              child: Padding(
                padding: const EdgeInsets.all(_cardBorderWidth),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (imageUrl != null)
                        CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: _imageSize,
                            imageUrl: imageUrl!),
                      ...cardContent,
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
