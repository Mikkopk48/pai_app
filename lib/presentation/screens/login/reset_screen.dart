import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/presentation/providers/providers.dart';
import 'package:pai/shared/widgets/widgets.dart';

class ResetScreen extends ConsumerWidget {
  static const name = 'reset_screen';

  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isVisible = ref.watch(textfieldVisibilityProvider);
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      SizedBox(
        height: height * 0.03,
      ),
      Text('Recuperar contraseña',
          style: Theme.of(context).textTheme.cardTitleTextStyle),
      CustomCard(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const CustomTextFormField(
              label: 'Ingresa Mail o Nombre de Usuario',
            ),
            const SizedBox(
              height: 100,
            ),
            CustomBigButton(
              text: 'Confirmar',
              color: AppColors.primary,
              onPressed: () => context.push('/login_screen'),
            ),
            const SizedBox(
              height: 100,
            ),
            const CustomTextFormField(
              label: 'Ingresa Codigo de verificación',
            ),
          ],
        ),
      ),
      CustomBigButton(
        text: 'Confirmar',
        onPressed: () => context.push('/login_screen'),
      )
    ]))));
  }
}
