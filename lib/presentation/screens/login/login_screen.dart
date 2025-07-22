import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/shared/widgets/widgets.dart';
import 'package:pai/config/theme/text_theme_extensions.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,
                child: Image.asset(
                  'assets/images/logo_pai.png',
                  // height: 100,
                ),
              ),
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'Bienvenido a PAI',
                      style: Theme.of(context).textTheme.cardTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomTextFormField(
                      label: 'Email:',
                    ),
                    const CustomTextFormField(
                      label: 'Contraseña:',
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomBigButton(
                        text: 'Insgresar',
                        onPressed: () => context.push('/user_selection_screen')),
                    const SizedBox(
                      height: 40,
                    ),
                    const PushText(
                      text: 'Olvidé mi contraseña',
                      location: '/reset_screen',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PushText(
                      text: 'No tengo Cuenta',
                      location: '/register_screen',
                      isOrange: false,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //TODO:IMPLEMENT METHOD
  validateData() {}
}
