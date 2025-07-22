
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pai/config/theme/theme.dart';
import 'package:pai/presentation/providers/providers.dart';
import 'package:pai/shared/widgets/widgets.dart';

class FathersChildData2Screen extends ConsumerWidget {
  static const name = 'fathers_child_data2';

  const FathersChildData2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isVisible = ref.watch(textfieldVisibilityProvider);
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text('Datos de su hijo',
                style: Theme.of(context).textTheme.cardTitleTextStyle),
            CustomCard(
              child: Column(
                children: [
                  Text('Condicion de su hijo',
                      style: Theme.of(context).textTheme.cardTitleTextStyle),
                  const _ConditionSelector(),
                  Visibility(
                    visible: isVisible,
                    child: const _ConditionSelector(),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: const _ConditionSelector(),
                  ),
                  SizedBox(height: height * 0.01),
                  TextButton(
                    onPressed: () {
                      ref.read(textfieldVisibilityProvider.notifier).state =
                          !ref.read(textfieldVisibilityProvider);
                    },
                    child: Text(
                      isVisible ? '- No mostrar' : '+ Agregar otra condicion',
                      style: Theme.of(context).textTheme.smallBoldTextOrange,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const Divider(
                    color: Color(0xFFA2A2A2),
                    thickness: 1,
                    height: 5,
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      Text("CUD",
                          style:
                              Theme.of(context).textTheme.cardTitleTextStyle),
                      const Text(
                          "  Opcional \n (certificado de discapacidad)",
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: height * 0.9),
                  const ImagePickerContainer(),
            const CustomBigButton(text: 'Continuar')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConditionSelector extends StatelessWidget {
  const _ConditionSelector();

  static const List<String> _options = [
    'Trastorno por Déficit de Atención e Hiperactividad (TDAH)',
    'Dislexia',
    'Discapacidad Intelectual Leve',
    'Trastorno del Espectro Autista (TEA)',
    'Demencia (incluyendo Alzheimer)',
    'Discalculia',
    'Disgrafía',
    'Afasia',
    'Trastornos de la Memoria',
    'Trastornos de las Funciones Ejecutivas',
    'Síndrome de Down',
    'Daño Cerebral Adquirido',
    'Trastornos del Procesamiento Auditivo',
    'Síndrome de X Frágil',
    'Síndrome de Williams',
    'Síndrome de Angelman',
    'Síndrome de Rett',
    'Síndrome de Prader-Willi',
    'Enfermedad de Huntington',
    'Adrenoleucodistrofia',
    'Leucodistrofias',
    'Síndrome de Cockayne',
    'Enfermedad de Batten',
    'Síndrome de Sanfilippo',
    'Trastornos Peroxisomales (como Síndrome de Zellweger)',
    'Trastorno de Ansiedad Generalizada',
    'Depresión Mayor',
    'Trastorno Obsesivo-Compulsivo (TOC)',
    'Trastorno Bipolar',
    'Trastorno de Aprendizaje No Verbal (TANV)',
    'Trastorno Específico del Lenguaje (TEL)',
    'Síndrome de Tourette',
    'Parálisis Cerebral',
    'Hidrocefalia',
    'Epilepsia Refractaria',
    'Esclerosis Tuberosa',
    'Fenilcetonuria (PKU)',
    'Síndrome de Lennox-Gastaut',
    'Enfermedad de Tay-Sachs',
    'Síndrome de Aicardi',
    'Esclerosis múltiple',
    'Trastorno Neurocognitivo Mayor',
    'Otra',
    'Prefiero no especificar',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue value) {
          if (value.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return _options.where((option) =>
              option.toLowerCase().contains(value.text.toLowerCase()));
        },
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: const InputDecoration(
                labelText: 'Condicion',
                border: OutlineInputBorder(),
                focusColor: null),
          );
        },
      ),
    );
  }
}
