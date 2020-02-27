import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

GlobalKey _mykey = new GlobalKey();
GlobalKey _key2 = new GlobalKey();
GlobalKey _key3 = new GlobalKey();
GlobalKey _key4 = new GlobalKey();

class PaddingExample extends StatelessWidget {
  const PaddingExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding')),
      body: Container(
        width: 300,
        height: 300,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue[300],
            Colors.blue[200],
            Colors.blue[100]
          ])),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.green])),
            ),
          ),
        ),
      ),
    );
  }
}

class ConstrainedExample extends StatelessWidget {
  const ConstrainedExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Constrains')),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                key: _mykey,
                constraints: BoxConstraints(
                    maxWidth: 300, minWidth: 100, maxHeight: 200),
                child: Container(
                  decoration: BoxDecoration(color: Colors.lightBlue),
                  child: Text('Constraints'),
                  alignment: Alignment.center,
                  width: 500,
                ),
              ),
              Container(
                  child: SizedBox(
                    key: _key2,
                    width: 60,
                    height: 60,
                    child: Container(
                      child: Text('Sized Box'),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10)),
              Container(
                margin: EdgeInsets.all(10),
                child: ConstrainedBox(
                  key: _key3,
                  constraints: BoxConstraints(
                      maxWidth: 350,
                      minWidth: 100,
                      maxHeight: 100,
                      minHeight: 30),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: 300,
                        minWidth: 120,
                        maxHeight: 120,
                        minHeight: 50),
                    child: Container(
                      width: 1000,
                      height: 1000,
                      decoration: BoxDecoration(color: Colors.lightGreen),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(_mykey.currentContext.size);
                  print(_key2.currentContext.size);
                  print(_key3.currentContext.size);
                },
                child: Text('show size'),
              ),
            ]));
  }
}

class DecorationBoxExample extends StatelessWidget {
  const DecorationBoxExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Decoration Demo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.redAccent,
                  Colors.orangeAccent,
                  Colors.yellow[200]
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5, 5),
                      blurRadius: 4.0)
                ],
              ),
              position: DecorationPosition.background,
              child: Container(
                width: 100,
                height: 100,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.lightBlue),
                ),
                alignment: Alignment.center,
              ),
            ),
            Text('background'),
            Divider(),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.redAccent,
                  Colors.orangeAccent,
                  Colors.yellow[200]
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5, 5),
                      blurRadius: 4.0)
                ],
              ),
              position: DecorationPosition.foreground,
              child: Container(
                width: 100,
                height: 100,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.lightBlue),
                ),
                alignment: Alignment.center,
              ),
            ),
            Text('foreground')
          ],
        ));
  }
}

class TransformExample extends StatelessWidget {
  const TransformExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transform')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.3),
              child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  child: Text('skewY 0.3'),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(color: Colors.black38, offset: Offset(10, 10))
                      ])),
            ),
            Transform(
                transform: Matrix4.rotationY(pi * 1 / 3),
                child: Container(
                  width: 100,
                  height: 50,
                  child: Text('rotate 30'),
                  decoration: BoxDecoration(color: Colors.cyan),
                  margin: EdgeInsets.all(10),
                )),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(color: Colors.grey),
              child: Transform.scale(
                scale: 0.5,
                child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.orange)),
              ),
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(color: Colors.grey),
              child: Transform(
                transform: Matrix4.diagonal3Values(0.8, 1, 1),
                child: Container(
                    decoration: BoxDecoration(color: Colors.redAccent)),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            RaisedButton(
              onPressed: () {
                print(_key4.currentContext.size);
              },
              child: Text('scale size'),
            )
          ]),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  ScaffoldExample({Key key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample>
    with SingleTickerProviderStateMixin {
  int _activeNavigator = 2;
  List tabs = ["第一项", "第二项", "第三项"];
  TabController tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Example'),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
          controller: tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                    icon: Icon(Icons.devices),
                  ))
              .toList(),
          onTap: (int i) {
            print(i);
            this.setState(() {
              tabController.index = i;
            });
          },
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((item) {
          return Center(
            child: Container(
              child: Text(item,
                  style: TextStyle(color: Colors.blue, fontSize: 30)),
            ),
          );
        }).toList(),
      ),
      drawer: Drawer(
          child: ListView.builder(
        itemBuilder: (context, i) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              '$i',
              style: TextStyle(fontSize: 18),
            ),
            padding: EdgeInsets.all(10),
          );
        },
        itemCount: 20,
      )),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Text('Float')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transform),
            title: Text('Transform'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transform),
            title: Text('Scaffold'),
          ),
        ],
        currentIndex: _activeNavigator,
        fixedColor: Colors.red,
        onTap: (e) {
          this.setState(() {
            _activeNavigator = e;
          });
          switch (e) {
            case 0:
              Navigator.of(context).pushNamed('/home');
              break;
            case 1:
              Navigator.of(context).pushNamed('/transform');
              break;
            case 2:
              Navigator.of(context).pushNamed('/scaffold');
              break;
            default:
          }
        },
      ),
    );
  }
}

class ClipExample extends StatelessWidget {
  const ClipExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image = Image.network(
      'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1409542008,2775622124&fm=111&gp=0.jpg',
      fit: BoxFit.contain,
      width: 100,
      height: 100,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Clip')),
      body: Column(
        children: [
          image,
          ClipOval(child: image),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
