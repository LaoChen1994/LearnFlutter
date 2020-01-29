import "package:flutter/material.dart";

void main() => runApp(new MyApp());

// Text组件
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'First App',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('第一个App'),
//         ),
//         body: new Center(
//           child: new Text(
//             '你好阿,用于测试长文本，你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本',
//             textAlign: TextAlign.center,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 20,
//               color: Color.fromARGB(255, 255, 133, 60),
//               decoration: TextDecoration.lineThrough,
//               decorationStyle: TextDecorationStyle.wavy
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Container 组件

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'First App',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('第一个App'),
//         ),
//         // 使用Container的例子
//         body: Center(
//           child: Container(
//             child: new Text(
//               'Hello',
//               style: TextStyle(fontSize: 30),
//             ),
//             alignment: Alignment.topLeft,
//             width: 1000,
//             height: 200,
//             // color: Colors.lightBlue,
//             padding: const EdgeInsets.all(10),
//             margin: EdgeInsets.all(10),
//             decoration: new BoxDecoration(
//               // 如果用渐变色的话和color这个背景色的属性不能重叠使用
//               gradient: const LinearGradient(
//                 colors: [Colors.lightBlue, Colors.orangeAccent]
//               ),
//               border: Border.all(width: 2, color: Colors.black),
//               transform: Matrix4.rotationZ(1/12),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// 使用图片的例子 Image.assets

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'First App',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('第一个App'),
//         ),
//         // 使用image asset的例子
//         body: Center(
//           child: Container(
//             child: new Column(children: [
//               new Text(
//                 'Hello',
//                 style: TextStyle(fontSize: 30),
//               ),
//               new Image.asset(
//                 'assets/images/icon.jpg',
//                 width: 500,
//                 height: 100,
//                 fit: BoxFit.contain,
//                 alignment: Alignment.bottomCenter,
//                 // 给图片加滤镜
//                 color: Colors.greenAccent,
//                 colorBlendMode: BlendMode.softLight,
//                 repeat: ImageRepeat.repeat
//               )
//             ]),
//             alignment: Alignment.topLeft,
//             width: 1000,
//             height: 500,
//             // color: Colors.lightBlue,
//             padding: const EdgeInsets.all(10),
//             margin: EdgeInsets.all(10),
//             decoration: new BoxDecoration(
//                 gradient: const LinearGradient(
//                     colors: [Colors.lightBlue, Colors.orangeAccent]),
//                 border: Border.all(width: 2, color: Colors.black)),
//             transform: Matrix4.rotationZ(1 / 12),
//           ),
//         ),
//       ),
//     );
//   }
// }

// 静态ListView例子
// 简单的组件抽离

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: '使用ListView',
//         home: Scaffold(
//           appBar: new AppBar(title: new Text('使用 List View')),
//           body: Container(alignment: Alignment.center, child: new MyList()),
//         ));
//   }
// }

// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new ListView(
//       scrollDirection: Axis.vertical,
//       children: <Widget>[
//         new ListTile(
//           leading: new Text(
//             "赞",
//             style:
//                 TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
//           ),
//           title: new Text('add_box'),
//         ),
//         new ListTile(
//           leading: new Icon(Icons.add_call),
//           title: new Text('add Call'),
//         ),
//         new Container(
//           child: new Image.asset('assets/images/icon.jpg'),
//           decoration: new BoxDecoration(
//               border: Border.all(color: Colors.greenAccent, width: 3)),
//           margin: EdgeInsets.all(10),
//           padding: EdgeInsets.all(20),
//         ),
//         new Image.asset('assets/images/icon.jpg'),
//       ],
//     );
//   }
// }

// 传参动态列表

// void main() =>
//     runApp(new MyApp(item: new List<String>.generate(100, (i) => "Item $i")));

// class MyApp extends StatelessWidget {
//   final List<String> item;
//   MyApp({Key key, @required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: '使用ListView',
//         home: Scaffold(
//             appBar: new AppBar(title: new Text('使用 List View')),
//             body: new ListView.builder(
//               itemCount: item.length,
//               itemBuilder: (context, index) {
//                 return new ListTile(
//                   title: new Text('${item[index]}'),
//                 );
//               },
//             )));
//   }
// }

// GridView相册效果

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View',
      home: Scaffold(
          appBar: new AppBar(title: new Text('Grid View')),
          body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                // 纵向之间的间隔
                mainAxisSpacing: 10.0,
                // 横向之间的间隔
                crossAxisSpacing: 10.0,
                // 长宽比
                childAspectRatio: 0.5),
            children: <Widget>[
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/06/151723.54470898_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/27/102155.97632815_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/17/105242.88827408_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/27/101619.41873766_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/16/102337.73663733_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2020/01/16/151210.15087026_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/27/101619.41873766_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2019/12/16/102337.73663733_140X210X4.jpg'),
              Image.network(
                  'http://img5.mtime.cn/mt/2020/01/16/151210.15087026_140X210X4.jpg'),
            ],
          )),
    );
  }
}
