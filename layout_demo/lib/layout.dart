import 'package:flutter/material.dart';
// Row 水平布局
class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Row Layout demo'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      '左边的文字',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.lightBlue,
                    Colors.lightGreen,
                    Colors.orangeAccent,
                    Colors.redAccent
                  ])),
                ),
                Expanded(
                  child: Container(
                    child: Text('右边的文字'),
                    color: Colors.blueAccent,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 200.0,
                    alignment: Alignment.center,
                  ),
                )
              ],
            )
          ],
        ));
  }
}

// Column 垂直布局
// column是根据children中的最宽的元素作为列宽，做的整一列的布局

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Column Layout demo'),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {},
                color: Colors.redAccent,
                child: new Text('Red Botton'),
              ),
              Expanded(child: new Text('大他大')),
              new RaisedButton(
                onPressed: () {},
                color: Colors.yellowAccent,
                child: new Text(
                  'yellow Button',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              new RaisedButton(
                onPressed: () {},
                color: Colors.lightBlue,
                child: new Text(
                  'Blue Button',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ));
  }
}

// Flex弹性布局
class FlexLayout extends StatelessWidget {
  const FlexLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('FlexContainer')),
        body: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(
                        '2/3',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(color: Colors.red),
                    )),
                Expanded(
                    child: Container(
                  child: Text(
                    '1/3',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(color: Colors.purple),
                ))
              ],
            ),
            Text('可以嵌套')
          ],
        ),
      ),
    );
  }
}

// Flow布局
class WrapFlow extends StatelessWidget {
  const WrapFlow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      'Malone',
      'Jack',
      'Mart',
      'Louis',
      'Kuna',
      'Julia',
      'Redict'
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Wrap 和 Flow')),
      body: Container(
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.center,
              textDirection: TextDirection.rtl,
              children: nameList
                  .map((item) => (Chip(
                        label: Text('$item', style: TextStyle(fontSize: 18.0)),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('${item[0]}',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      )) as Widget)
                  .toList(),
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
              children: List.generate(
                  10,
                  (i) => Container(
                        child: Text('$i', style: TextStyle(fontSize: 18.0)),
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.blue)),
                      )).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({@required this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (var i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w <= context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        y = y + margin.top + margin.bottom + context.getChildSize(i).height;
        x = margin.left;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = x + context.getChildSize(i).width + margin.right + margin.left;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 500);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}

// 绝对定位和层叠布局
class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var stack = new Stack(
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.lightGreen,
        ),
        Container(
          width: 300,
          height: 200,
          alignment: Alignment.center,
          child: Text(
            '元素居中',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(color: Colors.green),
        ),
        Container(
          decoration: new BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(width: 1, color: Colors.pinkAccent)),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(20.0),
          child: new Text('Caption'),
        ),
        Positioned(
          top: 10.0,
          left: 100,
          child: new Container(
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 1, color: Colors.greenAccent)),
            child: new Text('第二个层叠'),
          ),
        ),
      ],
      // alignment: const FractionalOffset(0.5, 0.9),
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.loose,
    );

    return Scaffold(
      appBar: new AppBar(title: new Text('层叠布局')),
      body: stack,
    );
  }
}

// Align
class AlignLayout extends StatelessWidget {
  const AlignLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
      ),
      body: Column(children: [
        Container(
          width: 300,
          height: 300,
          child: Align(
            child: Container(
              child: Text('右下角'),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue[200]),
            ),
            alignment: Alignment.bottomRight,
          ),
          decoration: BoxDecoration(color: Colors.red[200]),
        ),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(color: Colors.blue[100]),
          child: Align(
            child: Container(
              child: Text('另外一种居中方法'),
              decoration: BoxDecoration(color: Colors.red[100]),
            ),
            alignment: FractionalOffset(0.5, 0.5),
          ),
        )
      ]),
    );
  }
}

// 卡片布局
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build

//     var card = new Card(
//       child: new Column(
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               '张三',
//               style: TextStyle(fontWeight: FontWeight.w400),
//             ),
//             contentPadding: EdgeInsets.all(10),
//             subtitle: new Text('武汉锅盔商家'),
//             leading: new Icon(Icons.add_call),
//           ),
//           new Divider(
//             color: Colors.red,
//           ),
//           ListTile(
//             title: Text(
//               '李四',
//               style: TextStyle(fontWeight: FontWeight.w400),
//             ),
//             contentPadding: EdgeInsets.all(10),
//             subtitle: new Text('武汉热擀面商家'),
//             leading: new Icon(Icons.add_call),
//           ),
//           new Divider(
//             color: Colors.blueAccent,
//           ),
//           ListTile(
//             title: Text(
//               '王五',
//               style: TextStyle(fontWeight: FontWeight.w400),
//             ),
//             contentPadding: EdgeInsets.all(10),
//             subtitle: new Text('杭州西湖藕粉'),
//             leading: new Icon(Icons.add_call),
//           ),
//           new Divider(color: Colors.greenAccent),
//         ],
//       ),
//     );

//     return new MaterialApp(
//       title: '层叠布局',
//       home: Scaffold(
//         appBar: new AppBar(title: new Text('层叠布局')),
//         body: Column(
//           children: <Widget>[
//             card,
//           ],
//         ),
//       ),
//     );
//   }
// }