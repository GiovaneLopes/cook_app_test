import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 236,
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.home,
              color: Colors.orange.shade900,
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: .3,
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.heart,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
