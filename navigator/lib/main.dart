// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(title: "Navigation", home: new HomeScreen());
//   }
// }

// class HomeScreen extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('导航演示'),
//       ),
//       body: Row(
//         children: <Widget>[
//           RaisedButton(
//             child: Text('点击跳转'),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return LinkPage();
//               }));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LinkPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Link Page'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Text('This is Link Page'),
//               RaisedButton(
//                 child: Text('返回第一页'),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => new MyApp()));
//                 },
//               )
//             ],
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';

class Message {
  final String content; // 内容
  final String author; // 作者
  final String title; // 标题
  Message(this.content, this.author, this.title);
}

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Message> list =
        List.generate(20, (i) => Message('我是信息$i, 读完给我回个信息', '广告商人', '重要信息$i'));
    return MaterialApp(
      title: 'Center Message',
      home: MessageCenter(messageList: list),
    );
  }
}

class MessageCenter extends StatelessWidget {
  final List<Message> messageList;
  const MessageCenter({Key key, @required this.messageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(messageList);
    return Scaffold(
        appBar: AppBar(title: Text('信息中心')),
        body: ListView.builder(
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  child: Text(
                    '${messageList[index].title}',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(width: 1, color: Colors.yellowAccent)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                ),
                onTap: () {
                  _navigateWithParam(context, messageList[index]);
                },
              );
            }));
  }

  _navigateWithParam(BuildContext context, Message message) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MessageDetail(message: message,)));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class MessageDetail extends StatelessWidget {
  final Message message;
  const MessageDetail({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('信息详情')),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('信息标题: ${message.title}', style: TextStyle(fontSize: 14)),
              Text('信息内容: ${message.content}', style: TextStyle(fontSize: 14)),
              Text('信息作者: ${message.author}', style: TextStyle(fontSize: 14)),
              RaisedButton(
                child: Text('向Navigator传参'),
                onPressed: () {
                  Navigator.pop(context, '${message.title}传来的信息');
                },
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          decoration: BoxDecoration(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
