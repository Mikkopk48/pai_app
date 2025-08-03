import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';

import '../../../shared/widgets/widgets.dart';

class ProfessionalsData2Screen extends StatelessWidget {
  static const name = '/professionals_data2';
  const ProfessionalsData2Screen({super.key});

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
                    'Datos Personales:',
                    style: Theme.of(context).textTheme.cardTitleTextStyle,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const CustomTextFormField(
                    label: 'CBU:',
                  ),
                  const CustomTextFormField(
                    label: 'Título Habilitante:',
                  ),
                  // SizedBox(height: height * 0.08),
                  SizedBox(height: height * 0.05),
    
                  const ImagePickerContainer(),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomBigButton(
                text: 'Continuar',
                onPressed: () => context.push('/professionals_home_screen'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
