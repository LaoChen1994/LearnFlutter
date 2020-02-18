import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _userName = TextEditingController(text: "");
  TextEditingController _phoneNumber = TextEditingController();
  List<Map<String, Object>> hobbies = [
    {"name": '抽烟', "selected": false},
    {"name": "喝酒", "selected": false},
    {"name": "烫头", "selected": false}
  ];
  String _radioData = "";
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> checkSelection = [];
    List<Widget> checkBoxListileSelection = [];

    hobbies.forEach((item) {
      checkSelection.add(
        Container(
            child: Row(children: [
          Checkbox(
              value: item['selected'],
              onChanged: (bool isSelected) {
                setState(() {
                  item['selected'] = isSelected;
                });
              }),
          Text('${item['name']}')
        ])),
      );
    });

    hobbies.forEach((item) {
      checkBoxListileSelection.add(CheckboxListTile(
        value: item['selected'],
        onChanged: (value) {
          setState(() {
            item['selected'] = value;
          });
        },
        title: Text('${item['name']}'),
      ));
    });

    String selectedHobby = hobbies
        .where((item) => item['selected'])
        .map((elem) => elem['name'])
        .join(' ');

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                  hintText: '请输入您的姓名',
                  labelText: '用户名',
                  prefixIcon: Icon(Icons.person)),
              autofocus: true,
              style: TextStyle(
                color: Colors.red[200],
              ),
              focusNode: _focusNode,
            ),
            TextField(
              controller: _phoneNumber,
              decoration: InputDecoration(
                  hintText: '请输入电话',
                  labelText: '联系电话',
                  icon: Icon(Icons.phone)),
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
              ],
            ),
            RaisedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: Text('聚焦'),
            ),
            Row(
              children: <Widget>[
                Text('男'),
                Radio(
                    value: '男',
                    groupValue: this._radioData,
                    onChanged: (value) {
                      setState(() {
                        this._radioData = value;
                      });
                    }),
                Text('女'),
                Radio(
                    value: '女',
                    groupValue: this._radioData,
                    onChanged: (value) {
                      setState(() {
                        this._radioData = value;
                      });
                    })
              ],
            ),
            Row(
              children: [Text('使用CheckBox的例子'), ...checkSelection],
            ),
            // RadioListTile(
            //     value: '男',
            //     groupValue: this._radioData,
            //     subtitle: Text('性别选择'),
            //     title: Text('男'),
            //     onChanged: (value) {
            //       setState(() {
            //         this._radioData = value;
            //       });
            //     }),
            // RadioListTile(
            //     value: '女',
            //     groupValue: this._radioData,
            //     subtitle: Text('性别选择'),
            //     title: Text('女'),
            //     onChanged: (value) {
            //       setState(() {
            //         this._radioData = value;
            //       });
            //     }),
            Text('使用CheckBoxListile例子'),
            ...checkBoxListileSelection,
            RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: AlertDialog(
                          title: Text('填写的信息'),
                          content: Column(
                            children: <Widget>[
                              Text('姓名: ${_userName.text}'),
                              Text('手机号: ${_phoneNumber.text}'),
                              Text('性别: ${this._radioData}'),
                              Text('爱好: $selectedHobby')
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                        height: 400,
                      );
                    });
              },
              child: Text('看看填了啥'),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
