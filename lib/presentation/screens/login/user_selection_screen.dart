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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: _CustomCardModified(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text('Cuál es tu perfil:',
                      style: Theme.of(context).textTheme.cardTitleTextStyle),
                ),
              ),
               Row(
                children: [
                  const _RoleButton(
                    location: '/professionals_data1',
                    text: 'Profesional de apoyo a la integración',
                    color: AppColors.primary,
                    bottomRight: true,
                    topRight: true,
                  ),
                  SizedBox(width: width*0.04,),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  
                  SizedBox(width: width*0.1,),
                  const _RoleButton(
                    location: '/fathers_child_data1',
                    text: 'Tutor que busca profesionales',
                    color: AppColors.secondary,
                    bottomLeft: true,
                    topLeft: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const _RoleButton(
                    location: '/ai_chat_screen',
                    text: 'Profesor que quiere usar la IA de PAI',
                    color: AppColors.background,
                    bottomRight: true,
                    topRight: true,
                  ),
                  SizedBox(width: width*0.04,),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
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
  final bool topLeft;
  final bool bottomRight;
  final bool bottomLeft;
  final bool topRight;

  const _RoleButton({
    required this.text,
    required this.color,
    required this.location,
    this.topLeft = false,
    this.bottomRight = false,
    this.bottomLeft = false,
    this.topRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => context.push(location),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        width: width * 0.75,
        height: 230,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: topLeft ? const Radius.circular(100) : Radius.zero,
            bottomLeft: bottomLeft ? const Radius.circular(100) : Radius.zero,
            bottomRight: bottomRight ? const Radius.circular(100) : Radius.zero,
            topRight: topRight ? const Radius.circular(100) : Radius.zero,
          ),
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

class _CustomCardModified extends StatelessWidget {
  final Widget? child;
  const _CustomCardModified({this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          width: width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: child),
    );
  }
}
