

import 'package:flutter/material.dart';
import 'package:pai/presentation/screens/fathers/father_professional_chat_screen.dart';

import '../../../config/theme/theme.dart';

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