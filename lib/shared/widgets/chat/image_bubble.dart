import 'package:flutter/material.dart';

class ImageBubble extends StatelessWidget {
  final String imageUrl;

  const ImageBubble(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            alignment: Alignment.center,
            child: const Text('Cargando imagen...'),
          );
        },
      ),
    );
  }
}
