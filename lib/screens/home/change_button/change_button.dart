import 'package:flutter/material.dart';

class ChangeButton extends StatefulWidget {
  final bool loading;
  final Function getBreed;

  const ChangeButton(this.loading, this.getBreed, {Key key}) : super(key: key);

  @override
  _ChangeButtonState createState() => _ChangeButtonState();
}

class _ChangeButtonState extends State<ChangeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: Key("screens_home_floatingActionButton"),
      onPressed: () {
        if (!widget.loading) {
          widget.getBreed();
        }
      },
      tooltip: 'Decrement',
      child: widget.loading
          ? Center(
              child: CircularProgressIndicator(backgroundColor: Colors.white))
          : Icon(Icons.compare_arrows),
    );
  }
}
