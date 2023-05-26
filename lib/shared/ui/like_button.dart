import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  const LikeButton({super.key, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
