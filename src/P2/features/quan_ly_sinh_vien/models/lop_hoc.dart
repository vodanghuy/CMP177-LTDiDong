import '../models/sinh_vien.dart';

class LopHoc {
  String _tenLop;
  List<SinhVien> _dsSinhVien = [];

  LopHoc(this._tenLop);

  //Getters
  String get tenLop => _tenLop;
  List<SinhVien> get dsSinhVien => _dsSinhVien;

  //Setters
  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  void themSinhVien(SinhVien sv) => _dsSinhVien.add(sv);
  void hienThiDanhSachSinhVien() {
    print('Danh sách sinh viên lớp $_tenLop\n');
    print('---------------------------\n');
    for (var sv in _dsSinhVien) {
      sv.hienThiThongTinSinhVien();
      print('Xếp loại: ${sv.xepLoai()}');
      print('\n');
    }
  }
}
