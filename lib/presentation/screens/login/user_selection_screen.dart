import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/app_theme.dart';
import 'package:pai/config/theme/text_theme_extensions.dart';
import 'package:pai/shared/widgets/widgets.dart';

class UserSelectionScreen extends StatelessWidget {
  static const name = '/user_selection_screen';
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: CustomCard(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Yo soy:',style:Theme.of(context).textTheme.cardTitleTextStyle),
                const _RoleButton(
                  location: '/professionals_data1',
                  text: 'Soy un profecional de apoyo a la integración',
                  color: AppColors.primary,
                ),
                const SizedBox(
                  height: 30,
                ),
                const _RoleButton(
                  location: '/fathers_child_data1',
                  text: 'Soy un padre en busca de profesionales',
                  color: AppColors.secondary,
                ),
                const SizedBox(
                  height: 30,
                ),
                const _RoleButton(
                  location: '/ai_chat_screen',
                  text: 'Soy un profesor que quiere usar la IA de PAI',
                  color: AppColors.background,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String text;
  final Color color;
  final String location;

  const _RoleButton({
    required this.text,
    required this.color,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(location),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        width: 240,
        height: 230,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 18,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
