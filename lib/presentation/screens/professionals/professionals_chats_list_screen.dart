import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/shared/widgets/widgets.dart';

import '../../../config/theme/theme.dart';

class ProfessionalsChatListScreen extends StatefulWidget {
  static const name = '/professionals_chatslist_screen';
  const ProfessionalsChatListScreen({super.key});

  @override
  State<ProfessionalsChatListScreen> createState() =>
      _ProfessionalsChatListScreenState();
}

final Map<String, dynamic> chatResponse = {
  'chats': List.generate(
      2,
      (index) => {
            'id': index + 1,
            'name': 'Nombre de Padre',
            'lastMessage':
                'Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje '
          })
};

class _ProfessionalsChatListScreenState
    extends State<ProfessionalsChatListScreen> {
  List<dynamic> chatsList = [];

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  Future<void> _loadChats() async {
    // await Future.delayed(const Duration(seconds: 2));
    setState(() {
      chatsList = chatResponse['chats'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: 'Tus Chats'),
          const SearchBox(),
          Expanded(
            child: chatsList.isEmpty
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary,))
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: chatsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final element = chatsList[index];
                      return InkWell(
                        onTap: () => context.push('/father_professional_chat_screen'),
                        child: Card(
                           color: const Color(0xFFFFFFFF),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: CircleAvatar(
                                      child: Icon(Icons.person)),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element['name'],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        element['lastMessage'],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AiFloatingActionButton(),
      bottomNavigationBar: const CustomButtonAppBar(isFather: false),
    );
  }
}
