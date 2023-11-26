import 'package:chat_flutter_firebase/chat/model/text_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chat_flutter_firebase/shared/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;
  final String sala;

  const ChatPage({super.key, required this.nickName, required this.sala});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  final textoController = TextEditingController(text: '');
  String userId = "";

  @override
  void initState() {
    super.initState();
    carregarUsuario();
  }

  carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("Chat - ${widget.sala}" ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: db.collection("chats\\${widget.sala.toLowerCase()}").snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                children: snapshot.data!.docs.map((e) {
                                  var textModel = TextModel.fromJson(
                                      (e.data() as Map<String, dynamic>));
                                  return ChatWidget(
                                      textModel: textModel,
                                      itsme: textModel.userId == userId);
                                }).toList(),
                              );
                      }),
                ),
                Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: textoController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var textModel = TextModel(
                                nickname: widget.nickName,
                                text: textoController.text,
                                userId: userId);
                            await db
                                .collection("chats\\${widget.sala.toLowerCase()}")
                                .add(textModel.toJson());
                            textoController.text = '';
                          },
                          child: Icon(Icons.send, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
