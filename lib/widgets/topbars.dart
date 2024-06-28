import 'package:bookero/utils/app_assets.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HTopBar extends StatelessWidget {
  const HTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.g1color.withOpacity(0.3),
            AppColors.g2color.withOpacity(0.3)
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 8),
              child: Text(
                "Bookero",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  AppIcons.search,
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    AppIcons.menu,
                    height: 25,
                    width: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DTopBar extends StatelessWidget {
  const DTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 16, top: 8, right: 16, bottom: 12),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppIcons.back,
                  height: 25,
                  width: 25,
                ),
              ),
              Image.asset(
                AppIcons.back,
                height: 25,
                width: 25,
              ),
            ]));
  }
}

