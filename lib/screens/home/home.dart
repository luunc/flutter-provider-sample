import 'package:dxdart/providers/user_login_provider.dart';
import 'package:dxdart/screens/auth_protected_screen/auth_protected_screen.dart';
import 'package:dxdart/screens/home/change_button/change_button.dart';
import 'package:dxdart/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dxdart/providers/dog_breed_provider.dart';
import 'package:dxdart/screens/home/dog_info/dog_info.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<DogBreedProvider>(context, listen: false).getBreed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("screens_home_AppBar"),
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Selector<DogBreedProvider, List>(
              key: Key('screens_home_StreamBuilder'),
              selector: (_, provider) =>
                  [provider.data, provider.error, provider.getBreed],
              builder: (_, data, __) => DogInfo(
                data: data[0],
                error: data[1],
                retryFetchBreed: data[2],
              ),
            ),
            SizedBox(height: 15),
            Selector<UserLoginProvider, bool>(
              selector: (_, provider) => provider.isLogin,
              builder: (_, isLogin, __) {
                if (isLogin) return Text('loged in');
                return RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Go to login example',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Login.routeName);
                  },
                );
              },
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Go to protected route',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AuthProtectedScreen.routeName);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Selector<DogBreedProvider, bool>(
        selector: (_, provider) => provider.loading,
        builder: (_, loading, __) => ChangeButton(loading),
      ),
    );
  }
}
