import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextCompose extends StatefulWidget {
  TextCompose({@required this.onSubmit});

  final Function({String text, File imgFile}) onSubmit;

  @override
  _TextComposeState createState() => _TextComposeState();
}

class _TextComposeState extends State<TextCompose> {
  final messageController = TextEditingController();

  bool _isComposing = false;

  void _onSubmit(text) {
    widget.onSubmit(text: text);

    messageController.clear();

    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              File imgFile =
                  await ImagePicker.pickImage(source: ImageSource.camera);

              if (imgFile == null) return;

              widget.onSubmit(imgFile: imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: _onSubmit,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    _onSubmit(messageController.text);
                  }
                : null,
          )
        ],
      ),
    );
  }
}
