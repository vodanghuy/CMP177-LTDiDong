import 'dart:io';
import 'dart:math';

void main() {
  double? a, b, c;
  String? input;
  do {
    stdout.write('Nhập hệ số a (a khác 0): ');
    input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      stdout.write('Số a không hợp lệ, nhập lại!\n');
    }
  } while (a == 0);
  do {
    stdout.write('Nhập hệ số b: ');
    input = stdin.readLineSync();
    b = double.tryParse(input!);
    if (b == null) {
      stdout.write('Số b không hợp lệ, nhập lại!\n');
    }
  } while (b == null);
  do {
    stdout.write('Nhập hệ số c: ');
    input = stdin.readLineSync();
    c = double.tryParse(input!);
    if (c == null) {
      stdout.write('Số c không hợp lệ, nhập lại!\n');
    }
  } while (c == null);
  giaiPhuongTrinhBacHai(a!, b!, c!);
}

void giaiPhuongTrinhBacHai(double a, double b, double c) {
  double delta = b * b - 4 * a * c;
  if (delta > 0) {
    // Hai nghiệm phân biệt
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("Phương trình có hai nghiệm phân biệt:");
    print("x1 = $x1");
    print("x2 = $x2");
  } else if (delta == 0) {
    // Nghiệm kép
    double x = -b / (2 * a);
    print("Phương trình có nghiệm kép: x = $x");
  } else {
    // Vô nghiệm
    print("Phương trình vô nghiệm.");
  }
}
