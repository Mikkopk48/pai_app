import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/shared/widgets/widgets.dart';

class ProfessionalsVerificationScreen extends StatelessWidget {
  static const name = '/professional_verification_screen';
  const ProfessionalsVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView(
          children: [
            CustomCard(
              child: Column(children: [
                const Center(
                  child: Text(
                      'Su cuenta está en proceso de confirmación por parte de nuestro equipo...',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center),
                ),
                Image.asset('assets/images/logo_pai.png'),
              ]),
            ),
            CustomBigButton(
              text: 'Conocer la App',
              onPressed: () => context.go('/professionals_home_screen'),
            ),
          ],
        ),
      ),
    );
  }
}
