import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/app_theme.dart';
import 'package:pai/shared/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final size = MediaQuery.of(context).size;
    // final width = size.width;
    // final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.2,
              ),
              child: Image.asset(
                'assets/images/logo_pai.png',
                // 'assets/icons/logo_plus.svg',
                height: 400,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: CustomBigButton(
                text: 'Ingresar',
                onPressed: () => context.push('/login_screen'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No tienes cuenta?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => context.push('/register_screen'),
              child: const Text(
                'Registrate',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
