import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class NewPasswordScreen extends StatelessWidget {
  static const name = 'new_password_screen';

  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: height * 0.03,
      ),
      Text('Cambiar Contraseña',
          style: Theme.of(context).textTheme.cardTitleTextStyle),
      CustomCard(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            
            const CustomTextFormField(
              label: 'Nueva contraseña',
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Confirmar Contraseña:',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 50,
            ),
            const CustomTextFormField(
              label: 'Nueva contraseña',
            ),
            const SizedBox(
              height: 50,
            ),
            CustomBigButton(
              text: 'Confirmar',
              onPressed: () => context.push('/login_screen'),
            )
          ],
        ),
      ),
    ])));
  }
}

class _PinCodeTextField extends StatelessWidget {
  const _PinCodeTextField();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      onChanged: (value) {
        print("Código ingresado: $value");
      },
      onCompleted: (value) {
        print("Código completo: $value");
        // Podés verificarlo acá
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
        fieldHeight: 50,
        fieldWidth: 40,
        activeColor: AppColors.secondary,
        selectedColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        // Agregar sombra a cada campo
        // shadow: BoxShadow(
        // color: Colors.black.withOpacity(0.1), // Color de la sombra
        // blurRadius: 8, // Radio de difuminado de la sombra
        // offset: Offset(2, 2), // Desplazamiento de la sombra
        // ),
      ),
    );
  }
}
