import 'package:flutter/material.dart';

typedef TextListener = void Function(String text);

class InputFieldArea extends StatefulWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextListener textListener;
  final TextEditingController _textEditingController = TextEditingController();

  InputFieldArea(this.textListener, {this.hint, this.obscure, this.icon});

  @override
  State<StatefulWidget> createState() => InputFieldAreaState();
}

class InputFieldAreaState extends State<InputFieldArea>{

  @override
  void dispose() {
    widget._textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        ),
      ),
      child: new TextFormField(
        obscureText: widget.obscure,
        controller: widget._textEditingController
        ..addListener((){
          widget.textListener(widget._textEditingController.text);
        }),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            widget.icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}
