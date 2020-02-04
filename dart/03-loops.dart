import 'dart:math';

void main() {
  // if循环
  int score = Random().nextInt(100);
  if (score < 60) {
    print('不及格');
  } else if (score < 80) {
    print('回家继续补习');
  } else if (score < 90) {
    print('回家可以看电视');
  } else {
    print('可以回家打游戏了');
  }

  // 循环
  // 这里的var因为有死区的原因，所以有各自的作用域
  // 因此和JS不一样会输出 1 2 而不是 2 2
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());

  // 对于可迭代类型可以使用forEach来进行迭代
  // 使用forEach使用迭代的弊端是无法直接获得当前元素的索引值
  var students = List.generate(
      10, (i) => ({"name": 'students-$i', "score": Random().nextInt(100)}));

  students.forEach(
      (students) => print('${students["name"]}的分数是${students["score"]}'));

  // 使用for in 语法对迭代器进行使用
  // Set和List都可以使用for in来进行迭代
  for (var stu in students) {
    print(stu);
  }

  // 使用for in对Map进行遍历
  var collection = {"优秀": 1, "中等": 2, "不及格": 3};
  collection.forEach((key, value) => print('$key 的人数为 $value 人'));

  // while 和doWhile语法
  // while在循环前判断
  // do-while循环后判断
  var i = 0;
  while (i < 10) {
    i++;
    print(i);
  }

  i = 0;
  do {
    i++;
    print(i);
  } while (i < 10);

  // 使用break直接跳出整个循环
  // 使用continue跳出本次循环，直接进入下个循环
  for (var stu in students) {
    int _score = stu['score'];
    if (_score < 20) {
      print('出了个20分以下的,结束循环');
      break;
    }
    if (_score < 85) {
      continue;
    }
    print('${stu['name']}获得了优秀');
  }

  // 对于迭代元素可以通过where方法来进行过滤
  var goodStudent = students.where((stu) {
    int score = stu['score'];
    return score > 85;
  });
  print(goodStudent);

  // Switch-Case
  // 在判断的时候对于int, String类型在编译阶段通过==来进行判断，当值完全一致的时候才相同
  // 对于类来说必须具有完全的类函数才属于同一元素(不包括他的子类)
  var degree = ['优秀', '良好', '合格', '不合格'][Random().nextInt(4)];
  switch (degree) {
    // case里面处理的逻辑可以省略，会自动被略过，不会报错
    case '满分':
    case '优秀':
      print('90分以上');
      // 这里continue会直接打断break，执行default;
      continue fallThrough;
      break;
    case '良好':
      print('80-90分');
      break;
    case '合格':
      print('60分万岁');
      // 如果没有break 会报错
      break;
    fallThrough:
    default:
      print('要打屁股拉');
  }

  // assert语法
  // 不同的框架对assert 会有不同的捕获措施
  // 只会在开发模式中生效
    assert(50 > 100, '50 < 100');
}
