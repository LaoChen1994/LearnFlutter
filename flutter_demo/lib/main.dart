import "package:flutter/material.dart";

void main() => runApp(MyApp());

typedef numCallBack = Function Function(num);

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      title: '计算器',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
          appBar: AppBar(
            title: Text('计算器'),
          ),
          body: Calculator(initX: 0, initY: 0)),
    ));
  }
}

class Calculator extends StatefulWidget {
  final num initX, initY;
  Calculator({Key key, @required this.initX, @required this.initY})
      : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  num initX = 0, initY = 0, result;
  String _operator = "+";
  bool setY = false;
  static final suppoerOperator = ['+', '-', '*', '/'];

  _CalculatorState({Key key});

  VoidCallback getData(num value) {
    return () {
      setState(() {
        !setY
            ? initX = int.parse(initX.toString() + value.toString())
            : initY = int.parse(initY.toString() + value.toString());
      });
    };
  }

  void calRes() {
    setState(() {
      switch (_operator) {
        case "+":
          result = initX + initY;
          break;
        case "-":
          result = initX - initY;
          break;
        case "*":
          result = initX * initY;
          break;
        case "/":
          result = initX / initY;
          break;
        default:
      }
    });
  }

  Function handleOperator(String _op) {
    return () {
      if (suppoerOperator.contains(_op) && !setY) {
        setState(() {
          _operator = _op;
          setY = true;
        });
      }
      if (_op == '=') {
        calRes();
        setState(() {
          setY = false;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> operatorList = ['+', '-', '*', '/', '=']
        .map(
          (item) => Flexible(
              child: Container(
                child: RaisedButton(
                  onPressed: handleOperator(item),
                  child: Text(
                    '$item',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.greenAccent,
                ),
                margin: EdgeInsets.fromLTRB(
                    suppoerOperator.indexOf(item) == 0 ? 0 : 10, 0, 0, 0),
              ),
              flex: 1),
        )
        .toList();

    return Center(
        child: Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Text(
                      '$initX',
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                  ),
                  flex: 2),
              Expanded(
                  child: Container(
                    child: Text(
                      '$_operator',
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                  ),
                  flex: 1),
              Expanded(
                  child: Container(
                    child: Text(
                      '$initY',
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                  ),
                  flex: 2),
              Text('='),
              Expanded(
                  child: Container(
                    child: Text(
                      '$result',
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                  ),
                  flex: 2),
            ],
          ),
          Container(
            height: 30,
            child: Row(
              children: operatorList,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            margin: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  child: Text(
                    '清空',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      initY = 0;
                      initX = 0;
                      result = 0;
                      _operator = '+';
                    });
                  },
                  color: Colors.green,
                ),
                margin: EdgeInsets.only(right: 10),
              )
            ],
          ),
          KeyBoard(onChange: getData),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ));
  }
}

class KeyBoard extends StatelessWidget {
  final numCallBack onChange;

  const KeyBoard({Key key, @required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> numberKey = List.generate(9, (i) => i + 1)
        .map((item) => RaisedButton(
              onPressed: onChange(item),
              child: Center(
                child: Text(
                  '$item',
                  style: TextStyle(fontSize: 64, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Colors.green[200],
            ))
        .toList();

    return Flexible(
      child: Container(
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1),
            children: numberKey),
        margin: EdgeInsets.all(10),
      ),
      flex: 1,
    );
  }
}
