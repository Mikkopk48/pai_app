import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/widgets.dart';

import '../../../data/data.dart';



class FatherProfessionalChatScreen extends StatefulWidget {
  static const name = '/father_professional_chat_screen';
  const FatherProfessionalChatScreen({super.key});

  @override
  State<FatherProfessionalChatScreen> createState() => _FatherProfessionalChatScreenState();
}

class _FatherProfessionalChatScreenState extends State<FatherProfessionalChatScreen> {
  final List<Message> messageList = [
    Message(text: 'Mensaje de padre', fromFather: false),
    Message(text: 'Mensaje de profesional', fromFather: true),
    Message(text: 'Mensaje de padre', fromFather: false),
    Message(text: 'Respuesta de profesional', fromFather: true),
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
    return Scaffold(
      appBar: AppBar(elevation: 22,
        backgroundColor: AppColors.primary,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.account_circle),
        ),
        title: Text('Nombre de Profesional',
        style: Theme.of(context).textTheme.bigButtonTextStyle,),
        centerTitle: false,
      ),
      body: Padding(
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
