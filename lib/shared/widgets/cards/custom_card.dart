import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  const CustomCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
          width: width,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(2, 7),
              ),
            ],
          ),
          child: child),
    );
  }
}
