import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/shared/widgets/widgets.dart';

class FathersChatListScreen extends StatefulWidget {
  static const name = '/fathers_chatslist_screen';
  const FathersChatListScreen({super.key});

  @override
  State<FathersChatListScreen> createState() =>
      _FathersChatListScreenState();
}

final Map<String, dynamic> chatDataResponse = {
  'chats': List.generate(
      2,
      (index) => {
            'id': index + 1,
            'name': 'Nombre de Padre',
            'lastMessage':
                'Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje Este es el último mensaje '
          })
};

class _FathersChatListScreenState
    extends State<FathersChatListScreen> {
  List<dynamic> chatsList = [];

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  Future<void> _loadChats() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      chatsList = chatDataResponse['chats'];
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
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: chatsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final element = chatsList[index];
                      return InkWell(
                        onTap: () => context.push('/father_professional_chat_screen'),
                        child: Card(
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
      bottomNavigationBar: const CustomButtonAppBar(isFather: true),
    );
  }
}
