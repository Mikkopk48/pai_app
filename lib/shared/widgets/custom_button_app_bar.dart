import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme/app_theme.dart';

// enum UserRol {father,professional}

class CustomButtonAppBar extends StatefulWidget {
  final bool isFather;
  const CustomButtonAppBar({
    super.key,
    required this.isFather,
  });

  @override
  State<CustomButtonAppBar> createState() => _CustomButtonAppBarState();
}

class _CustomButtonAppBarState extends State<CustomButtonAppBar> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    String text =
        """PAI es una empresa que actualmente está desarrollando una aplicación para que el proceso de contratación de maestras integradoras para chicos con discapacidad cognitiva sea mucho más sencillo.

Ya que actualmente no existe ninguna aplicación que lo permita, la única forma es a través de grupos de facebook o WhatsApp, resultando en un proceso muy tedioso e ineficiente.

También gracias a la aplicación hará que las maestras integradora puedan conseguir trabajo con mucha más facilidad y permitirá que los padres con hijos con discapacidad cognitiva se aseguren de que están contratando al profesional correcto.


A su vez tenemos la intención de resolver un problema muy común en las escuelas.


Imaginamos que hay un chico con discapacidad cognitiva que asiste al colegio pero su familia no tiene los recursos para contratar a una maestra integradora.

Esto es un gran problema ya que un profesor que no está especializado en trabajar con chicos con discapacidad, no tiene las herramientas para enseñarles y termina pasando que el chico no puede aprender.


Para esto vamos a integrar una IA en la aplicación que actúe como maestra integradora y ayude al profesor de la clase a poder darle actividades personalizadas al chico con discapacidad cognitiva.

Y que así ningun chico se quede sin aprender.""";
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppColors.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: widget.isFather == true
                ? () => context.go('/fathers_home_screen')
                : () => context.go('/professionals_home_screen'),
            icon: (location == '/professionals_home_screen' ||
                    location == '/fathers_home_screen')
                ? const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
          ),
          IconButton(
            onPressed: widget.isFather == true
                ? () => context.go('/fathers_chatslist_screen')
                : () => context.go('/professionals_chatslist_screen'),
            icon: (location == '/professionals_chatslist_screen' ||
                    location == '/fathers_chatslist_screen')
                ? const Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 40,
                  )
                : const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 40,
                  ),
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sobre PAI'),
                      content: SingleChildScrollView(child: Text(text)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  ),
              icon: const Icon(
                Icons.info_outline_rounded,
                // Icons.info_rounded,
                color: Colors.white,
                size: 35,
              )),
          IconButton(
            onPressed: widget.isFather == true
                ? () => context.go('/fathers_profile_screen')
                : () => context.go('/professionals_profile_screen'),
            icon: (location == '/professionals_profile_screen' ||
                    location == '/fathers_profile_screen')
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 40,
                  ),
          ),
        ],
      ),
    );
  }
}

class AiFloatingActionButton extends StatelessWidget {
  const AiFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () => context.push('/ai_chat_screen'),
          shape: const CircleBorder(),
          child: Image.asset(
            location == '/ai_chat_screen'
            ? 'assets/images/bot_filled.png'
            : 'assets/images/bot.png',
            // 'assets/icons/bot_plus.svg',
            // 'assets/icons/bot_flled_plus.svg',
            height: 34,
          )),
    );
  }
}
