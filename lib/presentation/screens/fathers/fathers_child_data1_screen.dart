import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/widgets.dart';

class FathersChildData1Screen extends StatelessWidget {
  static const name = 'fathers_child_data1';
  const FathersChildData1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCard(
              child: Column(
                children: [
                  Text(
                    'Datos de su hijo:',
                    style: Theme.of(context).textTheme.cardTitleTextStyle,
                  ),
                   SizedBox(
                    height: height*0.05,
                  ),
                  const CustomTextFormField(
                    label: 'Nombre Completo:',
                  ),
                  const CustomTextFormField(
                    label: 'Fecha de nacimiento:',
                  ),
                  const CustomTextFormField(
                    label: 'Nivel:',
                  ),
                  const CustomTextFormField(
                    label: 'Grado/Año:',
                  ),
                  const CustomTextFormField(
                    label: 'Colegio:',
                  ),
                   const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
             height: height*0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomBigButton(
                text: 'Continuar',
                onPressed: () => context.push('/fathers_child_data2'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
