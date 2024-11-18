import '../models/sinh_vien.dart';
import '../models/lop_hoc.dart';

void main() {
  SinhVien sv1 = new SinhVien('Huy', 5, '24143123', 5.5);
  sv1.hienThiThongTinSinhVien();
  print('Xếp loại: ' + sv1.xepLoai());

  var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  sv.hienThiThongTinSinhVien();
  print('Xếp loại: ' + sv.xepLoai());
  print('Test getter: ${sv.hoTen}');
  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien("Võ Đăng Huy", 21, '2180608852', 10.0));
  lop.themSinhVien(SinhVien("Nguyễn Đào Anh Tuấn", 21, '2180608992', 2.0));
  lop.themSinhVien(SinhVien("Lê Quang Hiến", 21, '2180608122', 3.0));
  lop.hienThiDanhSachSinhVien();
}
