import 'package:bookero/pages/read_excerpt_page.dart';
import 'package:bookero/utils/app_assets.dart';
import 'package:bookero/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../pages/detail_page.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({
    super.key,
    required this.widget,
  });

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration:
                Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Interval(0.1, 1,
                      curve: Curves.fastOutSlowIn));
              return FadeTransition(
                opacity: curvedAnimation,
                child: child,
              );
            },
            pageBuilder:
                (context, animation, secondaryAnimation) {
              return ReadExcerptPage(
                bookExcerpt: widget.book.excerpt,
                animation: animation,
                bookTitle: widget.book.title,
              );
            }));
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.iColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.book,
              height: 25,
              width: 25,
              color: AppColors.bgColor,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "READ EXCERPT ",
              style: TextStyle(
                color: AppColors.bgColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

