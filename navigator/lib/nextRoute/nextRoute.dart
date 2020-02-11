import 'package:flutter/material.dart';

class NextRoute extends StatelessWidget {
  const NextRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Route'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Text('自定义的Route包'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Counter()));
          },
          child: Text('简单路由'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WithParam(
                text: '显示Param',
              );
            }));
          },
          child: Text('显示Param'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('route4/counter');
          },
          child: Text('我要去计数器'),
        ),
      ])),
    );
  }
}

class WithParam extends StatelessWidget {
  final String text;
  const WithParam({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('代参路由'),
        ),
        body: Text('$text'),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text('现在的数字是$_count'),
        FlatButton(
          onPressed: () {
            setState(() {
              ++_count;
            });
          },
          child: Text('按我++'),
          color: Colors.red,
        )
      ]),
    );
  }
}
