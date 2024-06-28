import 'package:bookero/models/books_model.dart';
import 'package:bookero/pages/read_excerpt_page.dart';
import 'package:bookero/utils/app_assets.dart';
import 'package:bookero/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../routes/read_route.dart';
import '../widgets/topbars.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.book, required this.animation});
  final BooksModel book;
  final Animation<double> animation;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController _scrollController;
  bool _showButtons = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _showButtons = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _showButtons = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          bottomOpacity: 0.8,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(80, 10),
            child: DTopBar(),
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Hero(
                  tag: widget.book.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      height: 350,
                      width: 250,
                      widget.book.image,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return FadeTransition(
                        opacity: CurvedAnimation(
                          parent: widget.animation,
                          curve: Interval(0.3, 1, curve: Curves.easeInExpo),
                        ),
                        child: child);
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.book.title.toUpperCase(),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Author | ${widget.book.author}",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            " Rating | ${widget.book.rating.toString()}",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.star,
                            color: AppColors.g1color[800],
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              "Introduction",
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.textColor.withOpacity(.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4),
                        child: Text(
                          widget.book.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Price |",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.textColor.withOpacity(.9),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " \$${widget.book.price}.0",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.g1color[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Reviews (192)",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor.withOpacity(.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          children: const [
                            Text('Similar Books',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.g2color,
                                  fontWeight: FontWeight.normal,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: moreBooks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    moreBooks[index],
                                    height: 200,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: bottomButtons(context),
    );
  }

  AnimatedContainer bottomButtons(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        height: _showButtons ? kFloatingActionButtonMargin + 50 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: ReadButton(widget: widget),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.g2color.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.buy,
                        height: 25,
                        width: 25,
                        color: AppColors.bgColor,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "BUY NOW",
                        style: TextStyle(
                          color: AppColors.bgColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
