import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/constants/constants.dart';

import '../widgets.dart';

class CustomJobOfferAlertDialog extends StatelessWidget {
  const CustomJobOfferAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Datos de tu Oferta'),
      content: SingleChildScrollView(
          child: Column(
        children: [
          const CustomTextFormField(
            label: "Título de oferta:",
          ),
          _TextFieldSelector(
            options: locationsList,
            text: 'Localización:',
          ),
          _TextFieldSelector(
            options: titlesList,
            text: "Busco:",
          ),
          _TextFieldSelector(
            options: timeList,
            text: "Tiempo:",
          ),
          _TextFieldSelector(
            options: typeList,
            text: "Tipo:",
          ),
          _TextFieldSelector(
            options: experienceList,
            text: "Experiencia requerida:",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Descripción:",
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
          child: const Text('Publicar'),
        ),
      ],
    );
  }
}

class _TextFieldSelector extends StatelessWidget {
  List<String> options;
  final String text;
  _TextFieldSelector({required this.options, required this.text});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue value) {
        if (value.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return options.where((option) =>
            option.toLowerCase().contains(value.text.toLowerCase()));
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: Theme.of(context).textTheme.inputTextTextStyle,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        );
      },
    );
  }
}
