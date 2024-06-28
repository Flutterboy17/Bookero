import 'package:bookero/utils/app_assets.dart';
import 'package:bookero/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReadExcerptPage extends StatefulWidget {
  const ReadExcerptPage(
      {super.key,
      required this.animation,
      required this.bookExcerpt,
      required this.bookTitle});

  final String bookExcerpt;
  final String bookTitle;
  final Animation<double> animation;

  @override
  // ignore: library_private_types_in_public_api
  _ReadExcerptPageState createState() => _ReadExcerptPageState();
}

class _ReadExcerptPageState extends State<ReadExcerptPage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollPosition() {
    setState(() {
      _scrollPosition =
          _scrollController.offset / _scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(80, 10),
            child: Padding(
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
                  Row(
                    children: [
                      Text(
                        "Progress",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Container(
                        width: 100.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: _scrollPosition,
                          child: Container(
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: AppColors.g2color,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chapter 1: ${widget.bookTitle}",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      widget.bookExcerpt,
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
