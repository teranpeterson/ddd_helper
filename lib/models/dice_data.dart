import 'package:tuple/tuple.dart';

class Dominos {
  final Set<Tuple2<int, int>> dominos;

  Dominos({required this.dominos});

  void add(int n1, int n2) {
    if (n1 <= n2) {
      dominos.add(Tuple2(n1, n2));
    } else {
      dominos.add(Tuple2(n2, n1));
    }
  }

  void clear() {
    dominos.clear();
  }

  List<Tuple2> get() {
    return dominos.toList()
      ..sort((a, b) {
        var x = a.item2.compareTo(b.item2);
        if (x == 0) {
          return a.item1.compareTo(b.item1);
        } else {
          return x;
        }
      });
  }
}
