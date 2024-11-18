import '../models/sach.dart';
import '../models/doc_gia.dart';
import '../models/thu_vien.dart';

void main() {
  var thuVien = ThuVien();
  var sach01 = Sach('S01', 'Lập trình hướng đối tượng', 'HUTECH', '');
  var sach02 = Sach('S02', 'Lập trình trên thiết bị di động', 'HUTECH', '');
  thuVien.dsSach.add(sach01);
  thuVien.dsSach.add(sach02);
  var docGia01 = DocGia('Võ Đăng Huy', 'DG01');
  var docGia02 = DocGia('Nguyễn Văn A', 'DG02');
  thuVien.dsDocGia.add(docGia01);
  thuVien.dsDocGia.add(docGia02);
  thuVien.hienThiDSSach();
  docGia01.muonSach(sach01);
  thuVien.hienThiDSSach();
  docGia01.muonSach(sach01);
}
