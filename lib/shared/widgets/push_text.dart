import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';

class PushText extends StatelessWidget {
  final String text;
  final String location;
  final bool isOrange;
  const PushText(
      {super.key,
      required this.text,
      required this.location,
      this.isOrange = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(location),
      child: Text(
        text,
        style: isOrange
            ? Theme.of(context).textTheme.smallBoldTextOrange
            : Theme.of(context).textTheme.smallBoldTextBlue
      ),
    );
  }
}
