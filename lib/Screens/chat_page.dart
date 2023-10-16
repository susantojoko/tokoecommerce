import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String productName;

  ChatPage({required this.productName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> messages = []; // Daftar pesan

  TextEditingController textController = TextEditingController(); // Controller untuk input teks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat With ${widget.productName}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: messages[index].isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: messages[index].isMe
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        messages[index].text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      setState(() {
                        messages.add(ChatMessage(textController.text, true)); // Menambahkan pesan pengguna ke daftar
                        textController.clear(); // Menghapus teks dari input
                        // Simulasi pesan balasan dari "sisi lain"
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            messages.add(
                                ChatMessage('Reply from the other side', false));
                          });
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe; // Menandai apakah pesan ini dari pengguna saat ini

  ChatMessage(this.text, this.isMe);
}
