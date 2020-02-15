import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dxdart/providers/dog_breed_provider.dart';

class ChangeButton extends StatefulWidget {
  final bool loading;

  const ChangeButton(this.loading, {Key key}) : super(key: key);

  @override
  _ChangeButtonState createState() => _ChangeButtonState();
}

class _ChangeButtonState extends State<ChangeButton> {
  @override
  Widget build(BuildContext context) {
    final dogBreedProvider =
        Provider.of<DogBreedProvider>(context, listen: false);

    return FloatingActionButton(
      key: Key("screens_home_floatingActionButton"),
      onPressed: () {
        if (!widget.loading) {
          dogBreedProvider.getBreed();
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
