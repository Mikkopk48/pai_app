import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';

import '../../../shared/widgets/widgets.dart';

class ProfessionalsData1Screen extends StatelessWidget {
  static const name = '/professionals_data1';
  const ProfessionalsData1Screen({super.key});

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
                    'Datos Personales',
                    style: Theme.of(context).textTheme.cardTitleTextStyle,
                  ),
                   SizedBox(
                    height: height*0.05,
                  ),
                  const CustomTextFormField(
                    label: 'DNI:',
                  ),
                  const CustomTextFormField(
                    label: 'CUIL:',
                  ),
                  const CustomTextFormField(
                    label: 'Fecha de nacimiento:',
                  ),
                  const CustomTextFormField(
                    label: 'Domicilio:',
                  ),
    
                   SizedBox(
                    height: height*0.20,
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
                onPressed: () => context.push('/professionals_data2'),
              ),
            )
          ],
        ),
      ),
    );
  }
}