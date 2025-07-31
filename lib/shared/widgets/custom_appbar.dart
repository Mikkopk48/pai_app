import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final Color color;
  final String text;
  const CustomAppBar({
    super.key,
    this.color = AppColors.primary,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          // topLeft: Radius.circular(30),
          // topRight: Radius.circular(30),
        ),
        child: AppBar(
          
          title: Text(
            text,
            style: Theme.of(context).textTheme.bigButtonTextStyle,
          ),
          centerTitle: true,
          backgroundColor: color,
          elevation: 22,
          automaticallyImplyLeading: false,
          
        ),
      ),
    );
  }
}
