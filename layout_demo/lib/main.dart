import "package:flutter/material.dart";
import './container.dart';
import './layout.dart';
import './scroll.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Homepage(),
      routes: {
        '/home': (context) => Homepage(),
        '/row': (context) => RowLayout(),
        '/column': (context) => ColumnLayout(),
        '/flex': (context) => FlexLayout(),
        '/flow': (context) => WrapFlow(),
        '/stack': (context) => StackLayout(),
        '/align': (context) => AlignLayout(),
        '/padding': (context) => PaddingExample(),
        '/constraint': (context) => ConstrainedExample(),
        '/decorateBox': (context) => DecorationBoxExample(),
        '/transform': (context) => TransformExample(),
        '/scaffold': (context) => ScaffoldExample(),
        '/clip': (context) => ClipExample(),
        '/singleChildScroll': (context) => SingleChildScrollExample(),
        '/listView': (context) => ListViewExample(),
        '/gridView': (context) => GridViewSample(),
        '/customScrollView': (context) => CustomScrollViewTestRoute(),
        '/scrollControl': (context) => ScrollControl()
      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('布局'),
            contentPadding: EdgeInsets.all(10),
            subtitle: Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/row');
                      },
                      child: Text('Row布局'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/column');
                        },
                        child: Text('Column布局')),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/flex');
                        },
                        child: Text('Flex盒布局')),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/flow');
                      },
                      child: Text('Wrap和Flow'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/stack');
                      },
                      child: Text('Stack布局'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/align');
                      },
                      child: Text('Align布局'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text('Container'),
            subtitle: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/padding');
                  },
                  child: Text('Padding'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/constraint');
                  },
                  child: Text('Constrained'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/decorateBox');
                  },
                  child: Text('DecorateBox'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/transform');
                  },
                  child: Text('Transform'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/scaffold');
                  },
                  child: Text('Scaffold'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/clip');
                  },
                  child: Text('Clip'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Scrollable Component'),
            subtitle: Wrap(
              direction: Axis.horizontal,
              spacing: 4.0,
              runSpacing: 8.0,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/singleChildScroll');
                    },
                    child: Text('Scrollbar')),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listView');
                    },
                    child: Text('ListViewScroll')),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/gridView');
                    },
                    child: Text('GridView')),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/customScrollView');
                    },
                    child: Text('CustomScrollView')),RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/scrollControl');
                    },
                    child: Text('Scroll Control')),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Text('+')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.hotel),
              onPressed: () {},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
