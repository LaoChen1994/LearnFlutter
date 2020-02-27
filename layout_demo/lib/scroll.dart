import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:english_words/english_words.dart';

class SingleChildScrollExample extends StatelessWidget {
  const SingleChildScrollExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SingleChildScrollView')),
        body: Scrollbar(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                // reverse: true,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                          children: List.generate(
                              30,
                              (i) => Container(
                                    child: Text("$i"),
                                    padding: EdgeInsets.all(20),
                                  ))),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))));
  }
}

class ListViewExample extends StatefulWidget {
  ListViewExample({Key key}) : super(key: key);

  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['无分割线', '有分割线', '无限加载'];
    TabController _tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);

    Widget divider = Divider(
      color: Colors.red,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((i) => Padding(
                      child: Text('$i'),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ))
                .toList()),
      ),
      body: TabBarView(controller: _tabController, children: [
        Scrollbar(
            child: ListView.builder(
          key: PageStorageKey(1),
          itemBuilder: (BuildContext context, int i) => Container(
            child: Text('随机item：${math.Random().nextDouble()}'),
            padding: EdgeInsets.all(20),
          ),
          itemCount: 20,
        )),
        Scrollbar(
            child: ListView.separated(
          key: PageStorageKey(2),
          separatorBuilder: (BuildContext contxt, int i) {
            return divider;
          },
          itemBuilder: (BuildContext context, int i) => Container(
            child: Text('随机item：${math.Random().nextDouble()}'),
            padding: EdgeInsets.all(20),
          ),
          itemCount: 20,
        )),
        Scrollbar(child: InfiniteListView())
      ]),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  InfiniteListView({Key key}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingText = '### loading ###';

  var _words = <String>[loadingText];

  void fetchData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        _words = _words;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Widget splitLine = Divider(
      color: Colors.red,
    );

    return Column(
      children: <Widget>[
        ListTile(
          title: Text('英文单词'),
        ),
        Expanded(
            child: Scrollbar(
                child: ListView.separated(
          itemBuilder: (context, i) {
            if (i == _words.length - 1 && i < 100) {
              fetchData();
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${_words[i][0]}'),
                    ),
                    title: Text('${_words[i]}'),
                  ),
                  CircularProgressIndicator()
                ],
              );
            } else if (i >= 100) {
              return ListTile(
                title: Text('$loadingText'),
              );
            }

            return ListTile(
              leading: CircleAvatar(
                child: Text('${_words[i][0]}'),
              ),
              title: Text('${_words[i]}'),
            );
          },
          itemCount: _words.length,
          separatorBuilder: (context, i) => splitLine,
        )))
      ],
    );
  }
}

class GridViewSample extends StatefulWidget {
  GridViewSample({Key key}) : super(key: key);

  @override
  _GridViewSampleState createState() => _GridViewSampleState();
}

class _GridViewSampleState extends State<GridViewSample>
    with TickerProviderStateMixin {
  static List<Container> gridList = List.generate(20, (i) {
    return Container(
      child: Text(
        '$i',
        style: TextStyle(fontSize: 20),
      ),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
    );
  }).toList();

  static List<String> gridTabs = ['固定个数', '固定长度'];

  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: gridTabs.length, vsync: this, initialIndex: 0);

    return Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
          bottom: TabBar(
            tabs: gridTabs
                .map((i) => Container(
                      child: Text('$i'),
                    ))
                .toList(),
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: gridList,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2,
                    maxCrossAxisExtent: 80,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                children: gridList,
              ),
            ),
          ],
        ));
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Scaffold(
      appBar: AppBar(title: Text('CustomScrollView')),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            return Container(
              child: Text('$i'),
              decoration: BoxDecoration(
                  color: Color.fromARGB(10 * i, 10 * i, 10 * i, 1)),
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
            );
          }, childCount: 20)),
        ],
      ),
    );
  }
}

class ScrollControl extends StatefulWidget {
  ScrollControl({Key key}) : super(key: key);

  @override
  _ScrollControlState createState() => _ScrollControlState();
}

class _ScrollControlState extends State<ScrollControl> {
  ScrollController _controller = ScrollController();
  bool _showBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > 400) {
        setState(() {
          _showBtn = true;
        });
      } else {
        setState(() {
          _showBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scrol controll'),
      ),
      body: ListView.builder(
          controller: _controller,
          itemBuilder: (context, i) {
            return Container(
              child: Container(
                child: Text('item-$i'),
                padding: EdgeInsets.all(20),
              ),
            );
          },
          itemCount: 20),
      floatingActionButton: !_showBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeInCirc);
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
