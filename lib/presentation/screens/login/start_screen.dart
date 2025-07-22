import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/shared/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    final height = MediaQuery.of(context).size.height;
    // final size = MediaQuery.of(context).size;
    // final width = size.width;
    // final height = size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.2,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_pai.png',
                    height: 450,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: CustomBigButton(
                  text: 'Ingrsar',
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
                child: Text(
                  'Registrate',
                  style: TextStyle(
                      color: secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
