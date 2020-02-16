import 'package:dxdart/models/dog_breed_model.dart';
import 'package:flutter/material.dart';

class DogInfo extends StatefulWidget {
  final DogBreed data;
  final Exception error;
  final Function retryFetchBreed;

  const DogInfo(
      {Key key, @required this.data, this.error, this.retryFetchBreed})
      : super(key: key);

  @override
  _DogInfoState createState() => _DogInfoState();
}

class _DogInfoState extends State<DogInfo> {
  @override
  void didUpdateWidget(DogInfo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(widget.error.toString()),
            duration: Duration(days: 365),
            action: SnackBarAction(
              label: "Retry",
              onPressed: widget.retryFetchBreed,
            ),
          ),
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scaffold.of(context).removeCurrentSnackBar();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          key: Key('screens_home_dog_info_Container'),
          height: 400,
          width: 400,
          decoration: getDecoration(),
          child: getContainerChild(),
        ),
        SizedBox(height: 10),
        Text(
          '${widget.data?.name ?? ''}',
          style: TextStyle(fontSize: 30),
          key: Key('screens_home_dog_info_NameText'),
        ),
        Text(
          '${widget.data?.origin ?? ''}',
          key: Key('screens_home_dog_info_OriginText'),
        ),
      ],
    );
  }

  BoxDecoration getDecoration() {
    if (widget.data?.imgUrl != null) {
      return BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.data.imgUrl),
        ),
      );
    }

    return null;
  }

  Widget getContainerChild() {
    if (widget.data?.imgUrl == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return null;
  }
}
