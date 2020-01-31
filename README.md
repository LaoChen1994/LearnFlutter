# Flutter 学习笔记

### 1. Flutter环境搭建

flutter需要的部件:

+ flutter sdk
+ android studio
+ 编辑器配置
+ 安卓模拟器

#### 1. flutter sdk的安装方法

> 如果是windows，应该直接按照官网教程安装没有问题，
>
> 本文的配置环境是在ubuntu 18.04 + 科学上网环境下安装成功的教程
>
> 如果没有科学上网的话，推荐使用flutter中文网上的方法使用国内源进行下载(速度更快):
>
> https://flutterchina.club/get-started/install/

+ 通过[flutter官网下载渠道](https://flutter.dev/docs/get-started/install/linux)下载linux专用的flutter sdk下载包
+ 解压文件到到制定目录

~~~bash
cd ~/Desktop/Flutter
tar xf ~/Downloads/flutter_linux_v1.12.13+hotfix.5-stable.tar.xz
~~~

+ 将flutter配置到对应对应的bash文件下

~~~bash
# 我用的是zsh，如果是bash的话把文件名改为.bashrc
echo export PATH="$PATH:`pwd`/flutter/bin" >> ~/.zshrc
~~~

+ 然后使该文件立即生效

~~~bash
source ~/.zshrc
# 测试flutter sdk安装是否成功
flutter doctor
~~~

出现结果只要不是flutter命令不存在说明安装成功，之后配置后续环境

#### 2. 安装android studio

+ 在ubuntu64 位机下需要安装一些32位的库

~~~bash
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
~~~

+ 安装java

~~~bash
sudo apt install default-jdk
# 安装完成后查看java版本
java --version
~~~

这里要注意java的版本，如果是通过sdkmanager进行后续android studio sdk的安装的话，这里java版本最好在10以下，不然后面会报错，解决方法：

[利用sdkmanager安装android sdk](https://linoxide.com/linux-how-to/install-android-sdk-manager-ubuntu/)

+ 下载android studio包，进行离线安装

通过[官网下载地址](https://developer.android.com/studio/#downloads)下载android studio IDE, 将得到的下载包进行解压

~~~bash
cd ~/Desktop/Android
tar -zxvf ~/Downloads/android-studio-ide-191.6010548-linux.tar.gz
# 运行android studio

cd ./android-studio/bin
./studio.sh
~~~

如果能够运行成功，说明android studio 安装成功

#### 3. 安装android sdk

采用android studio向导进行安装(这里一定要有梯子阿，不然会一直不成功)，我们需要通过设置代理，让下载的流量走到我们自己的梯子上，也就是从外部代理过，不然国内下载外部资源会失败。

**如果是shadowsocks的梯子的话，这里注意一点，因为ss是sock5的代理服务器，但是好像直接配置sock代理不生效,**, 我们需要通过**privoxy**将socks5的网络代理走到http的代理，具体方法可以参考[将socks请求转换为http](https://maplege.github.io/2017/09/04/socksTOhttp/)

**操作过程**

+ 安装prioxy

~~~bash
sudo apt-get install prioxy
~~~

+ 配置对应的配置文件

~~~bash
sudo vim /etc/privoxy/config
~~~

+ 添加代理端口

~~~bash
# 这里为你socks5代理服务器的端口
forward-socks5   /               127.0.0.1:1080 .
# 原文中说还要注意该下面
# 但是实测后发现，这句话不用加上去，可以搜索一下listen-address
# 其本身就有相应的监听端口，所以默认就不改了
listen-address localhost:8118
~~~

+ 重启prioxy服务

~~~bash
sudo service privoxy resstart
~~~

+ 配置android studio 代理

  这里要注意一定是配置为转发请求的代理端口也就是8118，如下图配置

  ![](./img/Selection_011.png)

+ 之后下载让他下载就好了，下载成功就能进入android studio的界面了，可能中间时间比较长

#### 4. 启动安卓模拟器

+ 点击工具栏中的AVD Manager打开管理界面

![](./img/Selection_012.png)

+ 添加对应的想要配置的模拟器，下载系统插件等
+ 完成后运行模拟器

**问题一：**

**模拟器文件安装失败**，或者安装失败因为权限的问题，是因为/dev/kvm没有访问权限，通过更改这个文件夹权限的方法即可完成对该文件夹的使用，其方法可参考[Android Studio 运行时出现/dev/kvm没有权限问题解决办法](https://blog.csdn.net/fesdgasdgasdg/article/details/83044535)

~~~bash
sudo chmod -R 755 /dev/kvm
# 这里需要将我的用户名改为你现在系统操作的用户名
sudo chown cyx -R /dev/kvm
~~~


**问题二：**

**运行模拟器秒退**，可能原因是多个CPU渲染而bios不兼容导致的，解决方法，使用软件渲染，禁用硬件渲染

![](./img/Selection_013.png)


#### 插件安装

使用vscode插件安装直接安装dart和flutter就好了，这里直接略过了

#### 结论

至此，通过flutter doctor 应该已经所有问题都通过了，如果android-license还有问题的话 使用提示的代码直接安装就好了

### 2. 基础组件的使用

#### 0. 心得

flutter并不像前端一样有分离的js,css,javascript,都是通过组件的形式进行安排的，布局是一个组件对象内的属性等等，因此组件是flutter的基础，一切控件的位置什么的都是通过组件配置的来实现的

#### 1. Text组件

text是用于添加文字元素的，并给文字设置样式等。

##### 代码案例

~~~dart
import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'First App',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('第一个App'),
        ),
        body: new Center(
          child: new Text(
            '你好阿,用于测试长文本，你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本你好阿,用于测试长文本',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 133, 60),
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.wavy
            ),
          ),
        ),
      ),
    );
  }
}

~~~

##### 结构说明：

+ appBar: 顶部的导航兰
+ body: 是下面的内容区
+ center代表垂直意义上的居中组件，其中的child代表center组件的族要内容
+ 这里的Text是一个一个组件
  + textAign: 用于设置文字位置
  + overflow: 用于设置文字溢出maxLines后的表现状态
  + style用于处理字体的具体样式

更多的API设定可以查看官方手册：[给文本添加样式]([https://flutterchina.club/web-analogs/#%E7%BB%99%E6%96%87%E6%9C%AC%E6%B7%BB%E5%8A%A0%E6%A0%B7%E5%BC%8F](https://flutterchina.club/web-analogs/#给文本添加样式))

#### 2. Container组件

该组件可以是一个容器，可以设置宽高，背景底色，margin, padding等，内部还可以作各种布局，类似于前端里面的拥有flex的div的感觉

##### 代码案例

~~~dart
import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'First App',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('第一个App'),
        ),
        // 使用Container的例子
        body: Center(
          child: Container(
            child: new Text(
              'Hello',
              style: TextStyle(fontSize: 30),
            ),
            alignment: Alignment.topLeft,
            width: 1000,
            height: 200,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              // 如果用渐变色的话和color这个背景色的属性不能重叠使用
              gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.orangeAccent]
              ),
              border: Border.all(width: 2, color: Colors.black),
              transform: Matrix4.rotationZ(1/12),
            ),
          ),
        ),
      ),
    );
  }
}

~~~

##### 结构说明

+ child代表里面的主要内容
+ width，height等用来设定该元素中的样式属性
+ transform，类似于css的transform有一些旋转，放大缩小的操作
+ margin和padding后的参数不跟const 也是可以生效的

具体可以参考[Container属性介绍](https://api.flutter.dev/flutter/widgets/Container-class.html)

#### 3. Image组件

##### 代码案例

~~~dart
import 'dart:io';

import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'First App',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('第一个App'),
        ),
        // 使用image asset的例子
        body: Center(
          child: Container(
            child: new Column(children: [
              new Text(
                'Hello',
                style: TextStyle(fontSize: 30),
              ),
              new Image.asset(
                'assets/images/icon.jpg',
                width: 500,
                height: 100,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                // 给图片加滤镜
                color: Colors.greenAccent,
                colorBlendMode: BlendMode.softLight,
                repeat: ImageRepeat.repeat
              )
            ]),
            alignment: Alignment.topLeft,
            width: 1000,
            height: 500,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.lightBlue, Colors.orangeAccent]),
                border: Border.all(width: 2, color: Colors.black)),
            transform: Matrix4.rotationZ(1 / 12),
          ),
        ),
      ),
    );
  }
}

~~~

##### 结构说明

+ 为一个container中添加多个元素可以通过Row或者Column组件，这些组件的child组件接受一个widget的数组，可以渲染多个组件
+ Image组件的使用

| 对象方法      | 作用                | 使用方法                                                     |
| ------------- | ------------------- | ------------------------------------------------------------ |
| Image.network | 插入网络图片        | 直接以字符串的形式输入网络图片地址即可，之后在配置图片的长宽，等等配置参数即可 |
| Image.assets  | 插入资源图片        | 1. 在目录下创建一个assets文件，下面对应文件夹防止<br />2. 配置pubspec.yaml文件，添加要加载的资源<br />例如添加: <br />      assets: <br />            \- assets/images/icon.jpg <br />3. 使用Image.asset('静态资源路径') |
| Image.file    | 使用设备中的图片    | 使用Image.File(File('设备资源的路径地址'))                   |
| Image.memory  | 加载Uint8List的图片 | 参数为一个base64的字符串                                     |

#### 4. ListView  列表组件

##### 1. 基础列表

###### 代码案例

~~~dart
import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '使用ListView',
        home: Scaffold(
          appBar: new AppBar(title: new Text('使用 List View')),
          body: Container(alignment: Alignment.center, child: new MyList()),
        ));
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new ListTile(
          leading: new Text(
            "赞",
            style:
                TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
          ),
          title: new Text('add_box'),
        ),
        new ListTile(
          leading: new Icon(Icons.add_call),
          title: new Text('add Call'),
        ),
        new Container(
          child: new Image.asset('assets/images/icon.jpg'),
          decoration: new BoxDecoration(
              border: Border.all(color: Colors.greenAccent, width: 3)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
        ),
        new Image.asset('assets/images/icon.jpg'),
      ],
    );
  }
}
~~~

###### 结构说明

+ listView外部不能嵌套Row组件，否则会报错
+ ListView是一个大的容器，里面的ListTile相当于每条列表信息，通过配置leading是设置最左边的表示，title代表的是他的标题
+ listView中的Children可以包含各种组件都是OK的
+ 组件的封装就相当于重新创建一个class然后通过 new 调用这个组件即可

##### 2. 动态ListView

###### 代码案例

~~~dart
import "package:flutter/material.dart";

void main() =>
    runApp(new MyApp(item: new List<String>.generate(100, (i) => "Item $i")));

class MyApp extends StatelessWidget {
  final List<String> item;
  MyApp({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '使用ListView',
        home: Scaffold(
            appBar: new AppBar(title: new Text('使用 List View')),
            body: new ListView.builder(
              itemCount:item.length,
              itemBuilder: (context, index) {
                return new ListTile(
                  title: new Text('${item[index]}'),
                );
              },
            )));
  }
}
~~~

###### 结构说明

+ List定义之后，通过generate 类似于JS中的map语法 产生对应的字符串
+ class传参，类中获取参数的步骤
  + final List<String> item 声明参数的类型和 参数名
  + 利用MyApp({Key key, @required this.item}): super(key: key), 声明，从父类继承的key和外部获取的元素需要通过@required进行获取 
  + 之后在类内调用获取的参数直接用item调用就好，不需要再通过this关键字进行调用
+ ListView根据参数动态生成列表的方法:
  + 设定itemCount的数量， listView动态生成列表的原理，根据itemCount进行循环生成
  + 通过itemBuilder进行动态生成，其中的index是循环的索引值，通过item[index]获得循环到的元素，之后通过获得的该元素，来组织得到每个单独的模块，来动态生成
  + 返回一个ListTile组件放到ListView中

#### 5. GridView网格列表

**GridView 和 ListView的区别**: listView是一个列表(左右上下的滑动列表)，类似于li，Grid是一个规定行列的表格，类似于table

###### 代码案例

~~~dart
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
~~~

###### 结构说明

+ GridView的效果是一个相册的效果就是手机点开相册，一块块豆腐干排列的效果
+ 常用参数说明gridDelegate
  + crossAxisCount: 横向的最大排列元素的个数
  + crossAxisSpacing: 横向元素时间的间隔
  + crossAxisSpacing: 纵向元素之间的间隔
  + childAspectRatio: 长宽比(横纵比)，这里是横的长度比纵宽度的
  + children: 是一个Widget[]

### 3. 布局部分

##### 1. Row水平布局

所谓的水平布局就是**单一横向的行内布局, 类似div标签**,每次调用一个Row，他会自动占用一行，其高度由内部元素的高度决定，Row组件是一个支持**弹性盒**布局的组件

###### 代码案例

~~~dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget Demo',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Row Layout demo'),
        ),
        body: Row(
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
            // 启用弹性盒模式
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
        ),
      ),
    );
  }
}
~~~

###### 结构说明

+ Row是一个横向布局的组件，其子元素会被横向排列，如果宽度大于屏幕宽度，则会把超出部分顶出屏幕
+ Row 是一个弹性盒模型，因此通过在子组件外包一个Expanded组件可以实现弹性布局
+ 这里适用于的布局情况是一端固定一端长度自适应，如果需要百分比布局的话需要使用FractionallySizedBox

##### 2. Column纵向布局

***column***是根据children中的最宽的元素作为列宽，做的整一列的布局，也支持弹性盒布局

###### 代码案例

~~~dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget Demo',
      home: Scaffold(
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
                Expanded(child: new Text('这是一个很长的内容')),
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
          )),
    );
  }
}
~~~

###### 结构说明

+ Column布局是弹性盒布局，通过Expanded来作自适应宽度布局
+ crossAxisAlignment: 横向布局的对齐方式
+ mainAxisAlignment: 纵向布局的对齐方式

##### 3. 百分比布局

百分比布局主要有两个手段

+ 使用FractionallySizedBox
+ 使用Flexible组件

###### 代码案例

+ 使用FractionallySizedBox

~~~dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget Demo',
      home: Scaffold(
          appBar: new AppBar(
            title: new Text('Row Layout demo'),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                    alignment: Alignment.bottomRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      heightFactor: 0.5,
                      child: Container(
                        height: 200,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
~~~

+ 使用Flexible

~~~dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget Demo',
      home: Scaffold(
          appBar: new AppBar(
            title: new Text('Row Layout demo'),
          ),
          body:
              Container(
                height: 500,
                margin: EdgeInsets.all(10),
                child: 
                Column(
                  children: <Widget>[
                    Flexible(
                      // 设置在所有Flex元素中的百分比占1/5
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Flexible(
                      // 占 3/5
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.red,
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      ),
                    ),
                    Flexible(
                     // 占1/5
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
    );
  }
}
~~~



###### 结构说明

+ FractionallySizedBox通过设置widthFactor, heightFactor可以将盒子的大小设置为父元素的百分比
+ FractionallySizedBox一般用来设置和父元素之间存在百分比大小的元素的场和宽，一般父元素内只有一个元素的时候用比较好
+ Flexible包裹的元素，通过flex设定其在所有flexible元素中的百分比，比如一共flex的有5份，设为flex:1的元素就是占1/5，和flex布局中的flex属性类似。

##### 4. 层叠布局(绝对定位)

###### 代码案例

~~~dart
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

~~~

###### 结构说明

+ 利用stack生成层叠对象，写在越前面的元素放在越下面，类似于z-index值越小
+ 利用Positioned包裹的元素其对齐位置按照top, left设置安排，如果没有包裹的元素继承Stack中的alignment
+ Postiion中设置百分比的定位还没研究过
+ FractionaslOffset可以设置其百分比对齐位置

