List<dynamic> a = [1, 2, 3];

List<String> b = ['a', 'b', 'c'];

void main() {
  a.insertAll(2, b);
  print(a);
}
