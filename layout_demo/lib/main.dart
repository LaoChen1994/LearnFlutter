import "package:flutter/material.dart";

void main() => runApp(MyApp());

// Row 水平布局

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'Layout Widget Demo',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('Row Layout demo'),
//         ),
//         body: new Row(
//           children: <Widget>[
//             Expanded(
//                 child: new RaisedButton(
//               onPressed: () {},
//               color: Colors.redAccent,
//               child: new Text('Red Botton'),
//             )),
//             Expanded(
//               child: new RaisedButton(
//                 onPressed: () {},
//                 color: Colors.yellowAccent,
//                 child: new Text(
//                   'yellow Button',
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: new RaisedButton(
//                 onPressed: () {},
//                 color: Colors.lightBlue,
//                 child: new Text(
//                   'Blue Button',
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Column 垂直布局
// column是根据children中的最宽的元素作为列宽，做的整一列的布局

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'Layout Widget Demo',
//       home: Scaffold(
//           appBar: new AppBar(
//             title: new Text('Column Layout demo'),
//           ),
//           body: new Center(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new RaisedButton(
//                   onPressed: () {},
//                   color: Colors.redAccent,
//                   child: new Text('Red Botton'),
//                 ),
//                 Expanded(child: new Text('大他大')),
//                 new RaisedButton(
//                   onPressed: () {},
//                   color: Colors.yellowAccent,
//                   child: new Text(
//                     'yellow Button',
//                     style: TextStyle(color: Colors.blueGrey),
//                   ),
//                 ),
//                 new RaisedButton(
//                   onPressed: () {},
//                   color: Colors.lightBlue,
//                   child: new Text(
//                     'Blue Button',
//                     style: TextStyle(color: Colors.blueGrey),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }

// 绝对定位和层叠布局
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     var stack = new Stack(
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               'http://img5.mtime.cn/mt/2019/12/06/151723.54470898_140X210X4.jpg'),
//           radius: 200,
//         ),
//         new Container(
//           decoration: new BoxDecoration(
//               color: Colors.lightBlue,
//               border: Border.all(width: 1, color: Colors.pinkAccent)),
//           padding: EdgeInsets.all(10.0),
//           margin: EdgeInsets.all(20.0),
//           child: new Text('Caption'),
//         ),
//         new Positioned(
//           top: 10.0,
//           left: 200,
//           child: new Container(
//             decoration: BoxDecoration(
//                 color: Colors.red,
//                 border: Border.all(width: 1, color: Colors.greenAccent)),
//             child: new Text('第二个层叠'),
//           ),
//         ),
//       ],
//       alignment: const FractionalOffset(0.5, 0.9),
//     );

//     return new MaterialApp(
//       title: '层叠布局',
//       home: Scaffold(
//         appBar: new AppBar(title: new Text('层叠布局')),
//         body: stack,
//       ),
//     );
//   }
// }

// 卡片布局

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var card = new Card(
      child: new Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '张三',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            subtitle: new Text('武汉锅盔商家'),
            leading: new Icon(Icons.add_call),
          ),
          new Divider(
            color: Colors.red,
          ),
          ListTile(
            title: Text(
              '李四',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            subtitle: new Text('武汉热擀面商家'),
            leading: new Icon(Icons.add_call),
          ),
          new Divider(
            color: Colors.blueAccent,
          ),
          ListTile(
            title: Text(
              '王五',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            subtitle: new Text('杭州西湖藕粉'),
            leading: new Icon(Icons.add_call),
          ),
          new Divider(color: Colors.greenAccent),
        ],
      ),
    );

    return new MaterialApp(
      title: '层叠布局',
      home: Scaffold(
        appBar: new AppBar(title: new Text('层叠布局')),
        body: card,
      ),
    );
  }
}
