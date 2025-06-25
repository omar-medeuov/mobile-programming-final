import 'package:flutter/material.dart';
import 'package:https_project/constants/text_style.dart';

import 'package:like_button/like_button.dart';


class SecondPage extends StatefulWidget {
  const SecondPage ({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List products = ['One Piece', 'Naruto', 'Banana fish', 'Jujutsu Kaisen'];
  @override
  Widget build (BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${products[index]}', style: AppTextStyles.px10blue,),
              trailing: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxHeight: 64,
                  maxWidth: 64,
                ),
                child: LikeButton(
                  size: 20,
                  circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ) ,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 0,
                ),
              ),
            );
          }
        )
      ),
    );
  }
}