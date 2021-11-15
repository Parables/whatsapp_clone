import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/chat_row_item.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ChatRowItem(pageName: pageName);
        });
  }
}
