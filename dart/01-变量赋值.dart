import 'dart:collection';

var t = "test dart";
dynamic param;

final b = 3.0;
dynamic tom = {
  'name': 'Tom',
  'age': 18,
  'friends': ['marry', 'jack'],
  'salary': 50.5
};

const String constParam = "const Param";

void main() {
  // dynmic 与 var的区别
  // 字符串类型
  param = "123";
  // 这句话会报错， var申明的时候类型已经定了
  // t = 123;
  // dynamic 或者 object声明的基类都可以被任意赋值，因为一切在dart中都是object类
  param = 123;

  // final 和 const 声明的变量不可被更改
  // 下面这句话会报错
  // b = 4;

  // 数值类型定义
  int num1 = 3;
  double num2 = 3.053;

  var expNum = 1e5;
  print(expNum); // 100000
  var hex = 0xff4444;
  print('hex = $hex'); // 16279156
  // 自动识别为double;
  var res = num1 + num2;
  print(res); // 6.0

  // int -> String
  print(num1.toString());

  // double -> String
  print('double2string ${res.toString()}'); // 6.053
  // 保留小数点后的位数
  print('double2String ${num2.toStringAsFixed(2)}'); // 3.05
  // 保留有效数字
  print('double2String ${num2.toStringAsPrecision(3)}'); // 3.1
  // 转换为指数
  print('trans2Exp ${num2.toStringAsExponential()}'); // 3.053e+0

  // string -> int or doublue
  // 使用Number的parse方法

  String s2n1 = '1';
  String s2n2 = '1.1';

  print(
      's2n1 = ${int.parse(s2n1)} s2n2 = ${double.parse(s2n2)}'); // s2n1 = 1 s2n2 = 1.1
  print(
      '********************************String****************************************');

  // 字符串类型
  var s1 = "string";
  String s2 = "string2";

  // 字符串拼接
  var s3 = '$s1 + $s2'; // string + string2
  var s4 = s1 + "+" + s2; // string+string2
  print(s3);
  print(s4);

  // 多行字符串
  var multi1 = "multi1="
      "这是"
      "多行字符串1";

  var multi2 = """
  muliti2=
  这是
  多行字符串2
  """;

  print(multi1);
  print(multi2);

  // 字符串转义
  var trans = 'multi3= \n 这是多行 \n 字符串3';
  var rawStr = r'multi3= \n 这是多行 \n 字符串3';
  print(trans);
  print(rawStr);

  // 字符串转数组
  print(s1.split(""));

  // 字符串类型List定义
  List<String> friends = tom['friends'];
  print(friends.where((name) => name.startsWith('m')));
  // 数组转字符串
  print(friends.join("-"));

  print(
      '********************************Boolean****************************************');

  // boolean
  // Check for an empty string.
  var fullName = '';
  print(fullName.isEmpty); // true

  // Check for zero.
  var hitPoints = 0;
  print(hitPoints <= 0); // true

  // Check for null.
  var unicorn;
  // 未定义值的变量为null 而不是undefined和js不同
  print(unicorn == null); // true

  // Check for NaN.
  // 除以0得到的结果为NaN
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN); // true 

  print(
      '********************************List****************************************');

  List<int> list1 = const [0, 1, 2];
  List<String> list2 = ['jack', 'mary'];
  List nullList;

  print('list1[1] = ${list1[1]}'); // 1
  // 不可修改类型
  // list1[1] = 2; // 报错，因为这里的list1是不可修改类型

  // list2长度只有2，添加额外的第三个元素是不被允许的
  // list2[2] = 'Tom';
  // 如果要增加list长度需要使用add方法
  list2.add('tom');
  list2[1] = 'Mary';
  print(list2);

  // list合并
  var list3 = [...list2, ...list1, ...?nullList];
  print(list3); // [jack, Mary, tom, 0, 1, 2]

  // List和if与for的连用

  const f1 = true;
  const f2 = false;

  List list4 = [
    '1',
    if(f1) 'f1',
    if(f2) 'f2',
    for (var i in list3) 'list4-$i' 
  ];

  print(list4);

  print(
      '********************************Set****************************************');

  Set<String> set1 = {"苹果", '香蕉', '火龙果'};
  set1.add('西瓜');
  set1.add('苹果');
  print(set1);
  set1.remove('西瓜');
  print(set1);

  Set<String> set2 = {'包子','馒头', '火腿肠'};
  print({...set1, ...?set2});

  bool addFood = false;
  List<String> fruit  = ['樱桃', '山竹', '水蜜桃'];

  print({...set1, if(addFood) ...set2, for(var i in fruit) 'extra-$i' });

  print(
      '********************************Map****************************************');

  var map1 = HashMap();
  map1['abc'] = '1';
  map1['cccasd'] = "2";
  map1['aaa123'] = "3";

  map1.forEach((key, value) => print('key=$key, value=$value'));

  var map2 = Map(); // LinkedHashMap
  map2['abc'] = '1';
  map2['cccasd'] = "2";
  map2['aaa123'] = "3";

  print(map2);
  map2.forEach((key, value) => print('key=$key, value=$value'));

  map2.remove('abc');
  print(map2);

  var map3 = {
    ...map1,
    ...map2
  };
  print(map3);

  var map4 = {
    ...map2
  };
  print(map4 == map2);
}
