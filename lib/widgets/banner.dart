import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class HBanner extends StatelessWidget {
  const HBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColors.bgAccentColor.shade300, width: 1),
            image: DecorationImage(
                image: AssetImage(AppAssets.bg), fit: BoxFit.cover),
            color: AppColors.bgAccentColor[200],
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
