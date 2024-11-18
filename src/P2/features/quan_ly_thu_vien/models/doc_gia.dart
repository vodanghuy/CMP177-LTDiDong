import '../models/sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _dsSachDangMuon = [];

  //Constructors
  DocGia(this._hoTen, this._maDocGia);

  //Getters
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get dsSachDangMuon => _dsSachDangMuon;

  //Setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  void muonSach(Sach sach) {
    if (sach.trangThaiMuon.isEmpty) {
      _dsSachDangMuon.add(sach);
      sach.trangThaiMuon = 'Đã được mượn';
    } else {
      print("Sách đã có người mượn");
    }
  }

  void traSach(Sach sach) {
    _dsSachDangMuon.remove(sach);
    sach.trangThaiMuon = '';
  }
}
