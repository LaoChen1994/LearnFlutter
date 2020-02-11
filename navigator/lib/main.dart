import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import './nextRoute.dart' as Route3;
import 'package:navigator/nextRoute/nextRoute.dart' as Route4;

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
      routes: {
        "home": (context) => MessageCenter(messageList: list),
        "route1": (context) => NewRoute(),
        "route2": (context) => NewRoute2(),
        "route3": (context) => Route3.NextRoute(),
        "route4": (context) => Route4.NextRoute(),
        "route4/counter": (context) => Route4.Counter()
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          print(
              'settings name = ${settings.name}， arguements=${settings.arguments}');
          return NewRoute2();
        });
      },
    );
  }
}

// 一个带有Scaffold的代表一个完整的页面
// Navigator跳转的页面其实就是另外一个完整页面的组件
// 使用pop回到页面
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> replyList = List.generate(
        10,
        (i) => RaisedButton(
              onPressed: () {
                Navigator.pop(context, "返回 回复信息$i");
              },
              child: Text('回复信息$i'),
            )).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("This is New Route"), ...replyList],
      ),
    );
  }
}

class NewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;
    DateTime newTime;

    Function getNewTime(DateTime time) {
      return () {
        newTime = time;
      };
    }

    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('路由页面2'),
      ),
      body: Center(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('用户名: ${args['name']}'),
            Text('生日: ${args['birth']}'),
            Text('喜好: ${args['hobby'] ?? '没有兴趣'}'),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "这是pop的信息1");
              },
              child: Text('Pop 信息1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '这是pop的信息2');
              },
              child: Text('Pop 信息2'),
            ),
            PickTime(
              onChange: getNewTime,
            )
          ],
        )),
      ),
    );
  }
}

class PickTime extends StatefulWidget {
  final Function onChange;

  PickTime({Key key, @required this.onChange}) : super(key: key);

  @override
  PickTimeState createState() => PickTimeState(onChange: onChange);
}

class PickTimeState extends State<PickTime> {
  final Function onChange;
  DateTime dateTime;

  PickTimeState({Key key, @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('${dateTime ?? '请选择正确时间'}'),
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2018, 3, 5),
              maxTime: DateTime(2019, 6, 7), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            print('confirm $date');
            setState(() {
              dateTime = date;
              onChange(date);
            });
          }, currentTime: DateTime.now(), locale: LocaleType.zh);
        },
      ),
    );
  }
}

class MessageCenter extends StatelessWidget {
  final List<Message> messageList;
  const MessageCenter({Key key, @required this.messageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(messageList);

    var userInfo = {
      "name": "测试用户名",
      "birth": "1998-1-1",
    };

    return Scaffold(
        appBar: AppBar(title: Text('信息中心')),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'route1');
                  },
                  child: Text('去路由页面1'),
                ),
                RaisedButton(
                  onPressed: () async {
                    // Navigator.of(context)
                    //     .pushNamed('route2', arguments: userInfo)
                    //     .then((reply) {
                    //   return showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: Text('回传内容'),
                    //           content: Text('$reply'),
                    //         );
                    //       });
                    // });
                    var reply = await Navigator.of(context)
                        .pushNamed('route2', arguments: userInfo);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('回传内容'),
                            content: Text('$reply'),
                          );
                        });
                  },
                  child: Text('去路由页面2'),
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('route3');
                    },
                    child: Text(
                      'NextRoute',
                      overflow: TextOverflow.ellipsis,
                    )),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('route4');
                  },
                  child: Text(
                    'my_component',
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
              ],
            ),
            Expanded(
              child: ListView.builder(
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
                            border: Border.all(
                                width: 1, color: Colors.yellowAccent)),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                      ),
                      onTap: () {
                        _navigateWithParam(context, messageList[index]);
                      },
                    );
                  }),
            ),
          ],
        ));
  }

  _navigateWithParam(BuildContext context, Message message) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MessageDetail(
                  message: message,
                )));
    print(result);
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
