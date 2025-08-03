import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const name = '/register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomCard(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Registrate en PAI',
                style: Theme.of(context).textTheme.cardTitleTextStyle,
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo_pai.png',
                height: height * 0.3,
              ),
              const CustomTextFormField(
                label: 'Nombre:',
              ),
              const CustomTextFormField(
                label: 'Email:',
              ),
              const CustomTextFormField(
                label: 'Contraseña:',
              ),
              const SizedBox(
                height: 30,
              ),
              const PushText(
                text: 'Ya tienes cuenta?',
                location: '/login_screen',
              ),
              const SizedBox(
                height: 25,
              ),
              CustomBigButton(
                text: 'Registrarse',
                onPressed: () => context.push('/user_selection_screen'),
              ),
              const SizedBox(width: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
