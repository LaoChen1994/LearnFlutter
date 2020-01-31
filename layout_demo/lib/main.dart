import "package:flutter/material.dart";

void main() => runApp(MyApp());

// Row 水平布局

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Layout Widget Demo',
//       home: Scaffold(
//           appBar: new AppBar(
//             title: new Text('Row Layout demo'),
//           ),
//           body: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     child: Center(
//                       child: Text(
//                         '左边的文字',
//                         style: TextStyle(color: Colors.white, fontSize: 15),
//                       ),
//                     ),
//                     width: 300,
//                     height: 200,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                       Colors.lightBlue,
//                       Colors.lightGreen,
//                       Colors.orangeAccent,
//                       Colors.redAccent
//                     ])),
//                   ),
//                   Expanded(
//                     child: Container(
//                       child: Text('右边的文字'),
//                       color: Colors.blueAccent,
//                       margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                       height: 200.0,
//                       alignment: Alignment.center,
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Container(
//                     width: 300,
//                     height: 300,
//                     color: Colors.red,
//                     alignment: Alignment.bottomRight,
//                     child: FractionallySizedBox(
//                       widthFactor: 0.7,
//                       heightFactor: 0.5,
//                       child: Container(
//                         height: 200,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 500,
//                 margin: EdgeInsets.all(10),
//                 child: 
//                 Column(
//                   children: <Widget>[
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(width: 1, color: Colors.black),
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       flex: 3,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(width: 1, color: Colors.black),
//                           color: Colors.red,
//                         ),
//                         margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                       ),
//                     ),
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(width: 1, color: Colors.black),
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
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
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var stack = new Stack(
      children: <Widget>[
        new Container(
          height: 300,
          color: Colors.lightGreen,
        ),
        new Container(
          decoration: new BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(width: 1, color: Colors.pinkAccent)),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(20.0),
          child: new Text('Caption'),
        ),
        new Positioned(
          top: 10.0,
          left: 200,
          child: new Container(
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 1, color: Colors.greenAccent)),
            child: new Text('第二个层叠'),
          ),
        ),
      ],
      alignment: const FractionalOffset(0.5, 0.9),
    );

    return new MaterialApp(
      title: '层叠布局',
      home: Scaffold(
        appBar: new AppBar(title: new Text('层叠布局')),
        body: stack,
      ),
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
