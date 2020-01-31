var t = "test dart";
dynamic param;
final b = 3;
dynamic tom = {
  'name': 'Tom',
  'age': 18,
  'friends': ['marry', 'jack'],
  'salary': 50.5
};


void main() {
  param = "123";

  // 这句话会报错， var申明的时候类型已经定了
  // t = 123;
  // dynamic 或者 object声明的基类都可以被任意赋值，因为一切在dart中都是object类
  param = 123;
  print(param);
  print(tom['friends']);

  // final 和 const 声明的变量不可被更改
  // b = 4;

}
