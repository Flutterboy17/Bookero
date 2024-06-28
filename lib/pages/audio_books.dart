import 'package:bookero/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/books_model.dart';

class AudioBooks extends StatelessWidget {
  const AudioBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: audioBooks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final data = audioBooks[index];
        return Padding(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16, bottom: 8),
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(data['image']),
                      child: Icon(
                        Icons.album,
                        color: AppColors.bgColor.withOpacity(
                          .6,
                        ),
                        size: 40,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColors.g2color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: AppColors.bgColor,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Auther | ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.bgAccentColor),
                        children: [
                          TextSpan(
                            text: data['author'],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.g1color[800],
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          " ${data['rating']} Rating",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
