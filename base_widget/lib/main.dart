import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './useCheckBox.dart';
import './form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        "home": (context) => MyHomePage(),
        "login": (context) => LoginPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  static getValue(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> fruitList = [
      {"name": "西瓜", "checked": false},
      {"name": "冬瓜", "checked": false},
      {"name": "胡萝卜", "checked": false},
      {"name": "土豆", "checked": false},
    ];

    return Scaffold(
        appBar: AppBar(title: Text('基础组件的使用')),
        body: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: SwitchComponent(),
              ),
              ListTile(
                leading: CheckList(checkList: fruitList),
              ),
              ListTile(
                leading: Container(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text('去登陆页'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
