class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _dtb;

  //Constructor
  SinhVien(this._hoTen, this._tuoi, this._maSV, this._dtb);

  //Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => maSV;
  double get dtb => _dtb;
  //Setters
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    _tuoi = (tuoi > 0) ? tuoi : tuoi;
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set dtb(double dtb) {
    _dtb = (dtb >= 0 && dtb <= 10) ? dtb : dtb;
  }

  void hienThiThongTinSinhVien() {
    print('Họ tên sinh viên: $_hoTen');
    print('Tuổi: $_tuoi');
    print('Mã số sinh viên: $_maSV');
    print('Điểm trung bình: $_dtb');
  }

  String xepLoai() {
    if (_dtb >= 8.0) return 'Giỏi';
    if (_dtb >= 6.5) return 'Khá';
    if (_dtb >= 5.0) return 'Trung bình';
    return 'Yếu';
  }
}

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

void main() {
  SinhVien sv1 = new SinhVien('Huy', 5, '24143123', 5.5);
  sv1.hienThiThongTinSinhVien();
  print('Xếp loại: ' + sv1.xepLoai());

  var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  sv.hienThiThongTinSinhVien();
  print('Xếp loại: ' + sv.xepLoai());
  print('Test getter: ${sv._hoTen}');
  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien("Võ Đăng Huy", 21, '2180608852', 10.0));
  lop.themSinhVien(SinhVien("Nguyễn Đào Anh Tuấn", 21, '2180608992', 2.0));
  lop.themSinhVien(SinhVien("Lê Quang Hiến", 21, '2180608122', 3.0));
  lop.hienThiDanhSachSinhVien();
}
