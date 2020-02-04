import 'dart:math';

class Point {
  // 定义函数内存在的变量和类型。
  num x;
  num y;
  num z = 0;

  // 函数的构造函数
  // 利用构造其传入对应的参数
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}

class Point2 {
  num x, y;

  // dart提供的语法糖，将对应传入的值，赋值内内部对应的参数
  // 如果不指定构造器的话，class会调用一个不带任何参数的默认构造器
  // 该构造器没有任何传参，并且在继承父类构造器的时候不会传参
  // 构造器不会被继承，当没有构造器，会调用默认的而不会继承父类的。
  Point2(this.x, this.y);
}

// 构造器是不会被继承的，所以父类的具名构造器也是不会被子类继承的
// 如果要使用父类的具名构造器，需要在子类上进行调用
class Point3 {
  num x, y;
  double initDis;

  // 可以直接通过冒号的方式对this.x, this.y进行赋值
  Point3(x, y)
      : x = x,
        y = y,
        initDis = sqrt(x * x + y * y);

  Point3.origin(num x, num y) {
    this.x = x;
    this.y = y;
    this.initDis = sqrt(x * x + y * y);
  }

  Point3.xAxis(num x) : this.origin(x, 0);

  getXYDistance() {
    return sqrt(x * x + y * y);
  }
}

// 具有具名构造器的父类继承过程
// 默认情况下
// 在继承的过程中，子类构造其调用父类非具名构造器
// 父类非具名构造器，调用main class的非具名构造器
class PointSubclass extends Point3 {
  num x, y, z;

  PointSubclass(this.x, this.y, this.z) : super.origin(x, y);
  // 按照需要继承的父类的情况进行赋值和继承
  PointSubclass.onlyXAxis(this.x) : super.xAxis(x);
}

class Person {
  String name;
  bool sex;

  Person(this.name, this.sex);

  showSex() {
    print('${this.name} 是一个 ${sex ? "男性" : "女性"}');
  }
}

// 如果父类的构造器不是默认构造器，即父类是具名构造器或者构造器具有一定的参数
// 那么需要手动调用父类构造器件，完成继承
// 其主要过程为利用：super调用父类的构造器
class Chinese extends Person {
  String name;
  bool sex;
  static const nation = "China";

  Chinese(this.name, this.sex) : super(name, sex);
}

// 使用工厂模式创建类的构造函数
class Animal {
  String type, name = '';
  static Animal _instance;

  Animal.getInstance(type, name) {
    this.type = type;
    this.name = name;
  }

  factory Animal(type, name) {
    if (_instance == null) {
      _instance = Animal.getInstance(type, name);
    }
    return _instance;
  }
}

class Dog extends Animal{
  String name;
  final String type = 'dog';

  Dog(this.name): super.getInstance('dog', name);
}

// const constructor
class ConstAdder {
  final num x;

  const ConstAdder(this.x);

  getRes(num value) {
    return this.x + value;
  }
}



void main() {
  // 类的声明过程
  var p = Point(1, 2);
  var p2 = Point2(1, 2);
  var p3 = Point3.origin(3, 4);

  p?.x = 3;

  // 继承

  var cubicPoint = PointSubclass(1, 2, 3);
  var xPoint = PointSubclass.onlyXAxis(10);

  double dis = cubicPoint.getXYDistance();
  print(cubicPoint.z);
  print(dis);
  print('只有x轴上的点：${xPoint.getXYDistance()}');

  var xiaoWange = Chinese('老王', true);
  xiaoWange.showSex();

  var xiaoLi = Chinese('老李', true);

  print('identity = ${identical(xiaoWange, xiaoLi)}');

  xiaoWange
    ..name = '小王'
    ..sex = true
    ..showSex();
  
  var adder = ConstAdder(3);

  print('adder.x = ${adder.x}');
  // 下面这句话会报错
  // adder.x = 4;

  print('add.Res = ${adder.getRes(10)}');

  // 类的调用过程
  print(p.x);
  print(p2.x);
  print(p3.y);

  // 使用factory构造函数
  var a1 = Animal('aunt', '子弹蚁');
  var a2 = Animal('elephant', '长毛象');

  print(identical(a1, a2));

  print(a1.name);
  print(a2.name);

  var dog1 = Dog('柯基');
  var dog2 = Dog('拉布拉多');

  print(dog1.name);
  print(dog2.name);
  print(identical(dog1, dog2));

  print('类方法');
}
