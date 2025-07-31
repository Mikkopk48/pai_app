

import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';
import '../../../data/data.dart';

class FatherMessageBubble extends StatelessWidget {
  final Message message;

  const FatherMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}