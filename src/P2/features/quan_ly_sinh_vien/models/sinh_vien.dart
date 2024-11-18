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
