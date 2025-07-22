import 'package:flutter/material.dart';
import 'package:pai/config/theme/app_theme.dart';

class CustomBigButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomBigButton({
    super.key,
    this.color,
    this.onPressed, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const secondary = AppColors.secondary;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0),
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(22),
          backgroundColor:WidgetStatePropertyAll(color ?? secondary),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
          child: Center(
            child: Text(
                text,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),
              ),
          ),
        ),
      ),
    );
  }
}
