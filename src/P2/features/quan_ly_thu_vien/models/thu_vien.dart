import '../models/sach.dart';
import '../models/doc_gia.dart';

class ThuVien {
  List<Sach> _dsSach = [];
  List<DocGia> _dsDocGia = [];

  //Getters
  List<Sach> get dsSach => _dsSach;
  List<DocGia> get dsDocGia => _dsDocGia;

  void themSach(Sach sach) {
    _dsSach.add(sach);
  }

  void themDocGia(DocGia docGia) => _dsDocGia.add(docGia);
  void hienThiDSSach() {
    for (var sach in _dsSach) {
      sach.hienThiThongTin();
    }
  }
}
