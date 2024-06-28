import 'package:bookero/models/books_model.dart';
import 'package:bookero/pages/detail_page.dart';
import 'package:bookero/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../widgets/banner.dart';
import '../widgets/topbars.dart';
import 'audio_books.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
            bottomOpacity: 0.8,
            bottom: PreferredSize(
              preferredSize: Size(80, 25),
              child: HTopBar(),
            )),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            HBanner(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Books",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppColors.textColor,
                        dashPattern: const [5, 5],
                        strokeWidth: 1,
                        radius: const Radius.circular(8),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: hRoute(context, index),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Audio Books",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16, color: AppColors.g2color),
                  )
                ],
              ),
            ),
            // Audio Books
            AudioBooks(),
          ]),
        ));
  }

  GestureDetector hRoute(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            reverseTransitionDuration: Duration(milliseconds: 800),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn));
              return FadeTransition(
                opacity: curvedAnimation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return DetailPage(
                book: books[index],
                animation: animation,
              );
            }));
      },
      child: Hero(
        tag: books[index].title,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            books[index].image,
            fit: BoxFit.cover,
            height: 300,
            width: 200,
          ),
        ),
      ),
    );
  }
}
