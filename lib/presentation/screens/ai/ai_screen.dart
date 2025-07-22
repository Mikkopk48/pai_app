import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/presentation/screens/fathers/father_professional_chat_screen.dart';
import 'package:pai/shared/widgets/widgets.dart';

class AiChatScreen extends StatefulWidget {
  static const name = '/ai_chat_screen';
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final List<Message> messageList = [
    Message(text: 'Mensaje de Ai', fromFather: false),
    Message(text: 'Mensaje de padre', fromFather: true),
    Message(text: 'Mensaje de Ai', fromFather: false),
    Message(text: 'Pregunta de padre', fromFather: true),
    // Message()
  ];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messageList.add(Message(text: text, fromFather: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ChatAppBar(title: 'IA de PAI'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      final message = messageList[index];
                      return message.fromFather
                          ? FatherMessageBubble(message: message)
                          : ProfessionalMessageBubble(message: message);
                    },
                  ),
                ),
                MessageFieldBox(onValue: sendMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ChatAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            // Acción para el ícono de cuenta
          },
        ),
      ],
      elevation: 22,
      backgroundColor: AppColors.primary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bigButtonTextStyle,
      ),
      centerTitle: true,
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            alignment: Alignment.center,
            child: const Text('Cargando imagen...'),
          );
        },
      ),
    );
  }
}
