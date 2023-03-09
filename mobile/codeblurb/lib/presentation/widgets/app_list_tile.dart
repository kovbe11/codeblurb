import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

const _cardBorderWidth = 1.0;
const _imageSize = 80.0;

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.elevation = 5,
    this.onTap,
    this.imageUrl,
    required this.cardContent,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.height = _imageSize,
  });

  final double elevation;
  final VoidCallback? onTap;
  final String? imageUrl;
  final List<Widget> cardContent;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppUIConstants.borderCircular6,
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: AppUIConstants.borderCircular6,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: AppUIConstants.borderCircular6,
            onTap: onTap,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.baseDarkGrey,
                border: Border.all(
                  color: Colors.black,
                  width: _cardBorderWidth,
                ),
                borderRadius: AppUIConstants.borderCircular6,
              ),
              child: Padding(
                padding: const EdgeInsets.all(_cardBorderWidth),
                child: Row(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      if (imageUrl != null)
                        CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: _imageSize * 1.25,
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
