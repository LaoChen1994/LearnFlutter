import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('输入框'),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _upasswordController = TextEditingController();
  bool isLoading = false;

  void handleSubmit() async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        isLoading = true;
      });
    });

    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        TextField(
          autofocus: true,
          controller: _unameController,
          decoration: InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名',
              prefixIcon: Icon(Icons.person)),
          onChanged: (value) {
            setState(() {
              _unameController.text = value;
            });
          },
        ),
        TextField(
          controller: _upasswordController,
          decoration: InputDecoration(
              labelText: '密码',
              hintText: '请输入密码',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.view_agenda)),
          obscureText: true,
          onChanged: (value) {
            setState(() {
              _upasswordController.text = value;
            });
          },
          onSubmitted: (value) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  handleSubmit();
                  return !isLoading
                      ? SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.grey[100],
                            valueColor:
                                AlwaysStoppedAnimation(Colors.blue[300]),
                          )))
                      : AlertDialog(
                          content: Column(
                            children: <Widget>[
                              Text('用户名: ${_unameController.text};'),
                              Text('密码: ${_upasswordController.text}')
                            ],
                          ),
                        );
                });
          },
        ),
        // LinearProgressIndicator(
        //   backgroundColor: Colors.grey,
        //   valueColor: AlwaysStoppedAnimation(Colors.blue[200]),
        // ),
        // Container(
        //   height: 100,
        // ),
        // SizedBox(
        //     width: 100,
        //     height: 100,
        //     child: CircularProgressIndicator(
        //       backgroundColor: Colors.grey[100],
        //       valueColor: AlwaysStoppedAnimation(Colors.blue[300]),
        //     ))
      ]),
    );
  }
}
