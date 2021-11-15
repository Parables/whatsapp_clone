import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/chat_counter.dart';

class ChatRowItem extends StatelessWidget {
  const ChatRowItem({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1530423470967-45b90dca3a4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80"),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Adriana",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text("Hello dear, welcome to the class"),
            ],
          ),
          const Spacer(),
          pageName == "Calls"
              ? const Icon(
                  Icons.call,
                  color: Colors.teal,
                )
              : Visibility(
                  visible: pageName == "Chats",
                  child: Column(
                    children: const [
                      Text("2:15 pm"),
                      SizedBox(height: 5),
                      ChatCounter(
                        count: 5,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
