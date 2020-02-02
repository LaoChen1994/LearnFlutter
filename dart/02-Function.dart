import 'package:meta/meta.dart';

var favoriateFruit = {"苹果", '香蕉', '橘子'};
var fruitMap = {"苹果": 5.5, '香蕉': 3.99, '橘子': 6.8};

// 当返回只有一句表达式可以使用箭头函数
bool isLiked(String fruit) => favoriateFruit.contains(fruit);

dynamic getFruitPrice() {
  print(favoriateFruit);
  print(fruitMap);
}

// 多重逻辑的时候需要使用函数表达式定义
// 未命名函数定义方法
// 通过位置参数命名的方式的函数，其需要通过添加匿名函数的话需要通过[]包裹对应的函数名
dynamic getPrice(String fruit, [String notes = '默认notes']) {
  if (notes != null) {
    print('notes = $notes');
  }

  if (favoriateFruit.contains(fruit)) {
    return fruitMap[fruit];
  }

  return null;
}

// 具名参数
// 通过@required来指定必填参数
// 这里定义的fruit和price是可选参数
void addFruit(
    {String fruit = "", double price = 100.0, @required String notes}) {
  favoriateFruit.add(fruit);
  fruitMap[fruit] = price;
  print(notes);
}

// 定义一个forEach的处理函数
void addFruitByList(Map<String, String> elem) {
  addFruit(
      notes: '批量增加水果',
      fruit: elem['fruit'],
      price: double.parse(elem['price']));
}

// 作用域语法
// 和JS一样一层一层向上寻找

void forScope() {
  // 变量定以后这个var和js中的const一样会存在死区，因此定义和了外部一样的变量就无法再获得外部变量的值了
  // 这里会报错
  // print(fruitMap);

  var fruitMap = {'测试'};
  print('我是第一层=$fruitMap');

  void Second() {
    var fruitMap = {'第二层'};
    print('我是第二层=$fruitMap');
  }

  Second();
}

// 闭包语法的使用
dynamic definePriceChanger(String fruit) {
  if (fruitMap.keys.contains(fruit)) {
    print('$fruit 价格可以变动');
    return (num price) {
      fruitMap[fruit] = price;
    };
  } else {
    return ([num _noParam]) {
      print('水果价格不可修改');
    };
  }
}

void main() {
  print(isLiked('草莓'));
  var price = getPrice('香蕉', '看看香蕉的价格');
  var nullPrice = getPrice('火龙果');
  print(price);
  print(nullPrice);

  List<Map<String, String>> fruitList = [
    {"fruit": "榴莲", "price": "32"},
    {"fruit": "菠萝", "price": "3.5"}
  ];

  // 调用具名函数香蕉
  addFruit(fruit: '草莓', price: 23.5, notes: '增加草莓');
  addFruit(notes: '冬瓜，价格不详', fruit: '冬瓜');
  getFruitPrice();

  // 函数是第一公民可以，可以将函数传给函数
  fruitList.forEach(addFruitByList);
  getFruitPrice();

  // 匿名函数的使用方法
  fruitList.forEach((elem) {
    String str = "${elem['fruit']}一斤价格是${elem['price']}";
    print(str);
  });

  // 如果表达式只有一句话，可以使用箭头函数
  fruitList.forEach((elem) => print("${elem['fruit']}一斤价格是${elem['price']}"));

  // 局部作用域的使用
  forScope();

  // 闭包的使用方法
  var changeBanana = definePriceChanger('香蕉');
  getFruitPrice();
  changeBanana(2.99);
  getFruitPrice();
}
