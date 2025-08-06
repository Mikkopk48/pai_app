import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../config/theme/theme.dart';

class RateButton extends StatelessWidget {
  const RateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.amberAccent),
          foregroundColor: WidgetStatePropertyAll(AppColors.textBlack),
          backgroundColor: WidgetStatePropertyAll(AppColors.white)),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.amber[50],
          title: const Text('Puntuar'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Comentario:",
                    hintStyle: Theme.of(context).textTheme.inputTextTextStyle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          )),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
      label: const Text('Puntuar'),
      icon: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
