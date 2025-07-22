

import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/presentation/screens/fathers/father_professional_chat_screen.dart';
import 'package:pai/shared/widgets/widgets.dart';

class ProfessionalMessageBubble extends StatelessWidget {
  final Message message;

  const ProfessionalMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        if (message.imageUrl != null) ...[
          const SizedBox(height: 5),
          ImageBubble(message.imageUrl!),
        ],
        const SizedBox(height: 10),
      ],
    );
  }
}
