import 'dart:math';
import 'package:meta/meta.dart';

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

class Point4 {
  num x, y;

  Point4({num x, num y}) {
    this.x = x;
    this.y = y;
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

  static num maxAge = 120;

  static void getMaxAge() {
    print('人的最大寿命为$maxAge');
  }

  Person(this.name, this.sex);

  showSex() {
    print('${this.name} 是一个 ${sex ? "男性" : "女性"}');
  }
}

class YelloPeople {
  String skinColor = 'yellow';

  void setSkinColor(value) {
    skinColor = value;
  }
}

class Asian implements Person, YelloPeople {
  String name;
  bool sex;
  String skinColor;

  showSex() {
    print('新的showSex方法 $name 是 $sex');
  }

  setSkinColor(value) {
    skinColor = value;
  }

  haveFun() {
    print('$name have fun');
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

  changeType(type) {
    _instance.type = type;
  }

  changeName(name) {
    _instance.name = name;
  }
}

class Dog extends Animal {
  String name;
  final String type = 'dog';

  Dog(this.name) : super.getInstance('dog', name);
  void bark() {
    print('Wang Wang');
  }

  void shouldBark() {
    this.bark();
  }
}

// 方法的覆盖override
// 继承了父类该方法的参数列表等
// 如果直接重写不用override可以各种定义参数过程
// 但是容易造成代码混乱，不推荐
class Kely extends Dog {
  String name;

  Kely(this.name) : super(name);

  @override
  void bark() {
    print('汪汪');
  }
}

// 类参数的合并操作符

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

// const constructor
class ConstAdder {
  final num x;

  const ConstAdder(this.x);

  getRes(num value) {
    return this.x + value;
  }
}

// 类方法
// 上述定义的方法均为实例方法
// 在实例化对象后可以通过.进行调用
// get set方法

class Circle {
  num dx, dy, radius;

  Circle(this.dx, this.dy, this.radius);

  dynamic get circleOrigin => {"dx": this.dx, "dy": this.dy};

  set circleOrigin(value) {
    this.radius = sqrt(value / pi);
  }

  set customRadius(value) {
    print('radius change $value');
    radius = value;
  }

  num getArea() {
    return pi * radius * radius;
  }
}

// 抽象类，抽象类很多时候只是定义一个类的接口类型
// 便于后续的类进行定义
abstract class Lesson {
  String lessonName, teacher;

  void printLessonInfo();
  void changeTeacher(String teacher);
  void expandedFunc();
}

class Math extends Lesson {
  String teacher;
  final String lessonName = 'Math';

  Math(this.teacher);

  void printLessonInfo() {
    print('${this.teacher}是教${this.lessonName}');
  }

  // 这里如果不定义changeTeacher方法会报错
  // 因为在抽象类上已经定义了必须有的接口类型
  void changeTeacher(String teacher) {
    this.teacher = teacher;
  }

  void callTeacher() {
    print('${this.teacher} is on the way');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    print('${invocation.memberName} is not existed');
  }
}

// 想要实现父类的所有API 但是不引用父类的所有实现
// 在本函数中改写所有父类的方法
// 另外，implements具有多继承的特点
// 但其本身不具有构造函数，所以需要通过get set方法对参数进行设置

class AdvancedMath implements Math {
  get teacher => "ZhangeSan";
  get lessonName => 'Advanced Mathmatics';

  // set get方法也可以选择不定义

  set lessonName(value) {
    print('new lesson name is $value');
    // 这样会报错
    // 导致堆栈溢出
    // lessonName = value;
  }

  set teacher(value) {
    print('new teacher is $value');
  }

  void printLessonInfo() {
    print('现在是高等数学课程');
  }

  void changeTeacher(String teacher) {
    this.teacher = teacher;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    print('${invocation.memberName} is not existed');
  }
}

enum Color { red, green, blue }

// mixins能够使类复用多个类的代码
// 使用方法: 在类后使用with关键字，后面跟几个mixin的名称

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  String myName();

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('${this.myName()} Humming to self');
    }
  }
}

class Maestro extends Person with Musical {
  String name;
  bool sex;
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  String myName() => this.name;

  Maestro({@required name, @required sex, canPlayPiano, canCompose, canConduct})
      : super(name, sex) {
    this.name = name;
    this.sex = sex;
    this.canPlayPiano = canPlayPiano ?? false;
    this.canCompose = canCompose ?? false;
    this.canConduct = canConduct ?? false;
  }
}

void main() {
  // 类的声明过程
  var p = Point(1, 2);
  var p2 = Point2(1, 2);
  var p3 = Point3.origin(3, 4);
  var p4 = Point4(x: 1, y: 2);

  p?.z = 3;
  print(p.z);
  print('p4.x = ${p4.x}');

  // 继承
  var cubicPoint = PointSubclass(1, 2, 3);
  var xPoint = PointSubclass.onlyXAxis(10);

  double dis = cubicPoint.getXYDistance();
  // 使用
  print('只有x轴上的点：${xPoint.getXYDistance()}');

  // 使用类的静态方法和静态变量

  print(Person.maxAge);
  Person.getMaxAge();

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

  a1.changeName('长毛象');
  print(a1.name);
  print(a2.name);

  var dog1 = Dog('柯基');
  var dog2 = Dog('拉布拉多');

  print(dog1.name);
  print(dog2.name);
  print(identical(dog1, dog2));

  print(
      '----------------------------------类方法------------------------------------');

  var c1 = Circle(10, 10, 30);

  print('radis = ${c1.radius}');
  print('area = ${c1.getArea()}');

  c1.circleOrigin = 10;
  c1.customRadius = 11;
  print(c1.radius);

  var math = Math('tony');
  math.printLessonInfo();
  math.callTeacher();
  math.expandedFunc();

  var advanced = AdvancedMath();
  advanced.callTeacher();

  advanced.printLessonInfo();
  advanced.lessonName = 'tgest';
  print(advanced.lessonName);

  var testDog = Kely('测试犬');

  testDog.shouldBark();

  final v = Vector(2, 3);
  final w = Vector(2, 2);

  final z = v + w;

  print('z.x = ${z.x} z.y= ${z.y}');

  print('******************************Enum*******************************');

  List<Color> colors = Color.values;
  print(colors);

  print('******************************mixins*******************************');
  // mixins能够使类复用多个类的代码

  var singer1 = Maestro(name: '张三', sex: false, canConduct: true);

  singer1.showSex();
  singer1.entertainMe();
}
