class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //Constructors
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //Setters
  set maDienThoai(String maDienThoai) {
    RegExp regExp = RegExp(r'^DT-\d{3}$');
    if (maDienThoai.isNotEmpty && regExp.hasMatch(maDienThoai)) {
      _maDienThoai = maDienThoai;
    }
  }

  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isNotEmpty) {
      _tenDienThoai = tenDienThoai;
    }
  }

  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isNotEmpty) {
      _hangSanXuat = hangSanXuat;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  //Tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }

  //Hiển thị thông tin điện thoại
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Gía bán: $_giaBan');
    print('Gía nhập: $_giaNhap');
    print('Số lượng tồn kho: $_soLuongTonKho');
    if (_trangThai == true) {
      print('Trạng thái: còn kinh doanh\n');
    } else {
      print('Trạng thái: không còn kinh doanh\n');
    }
  }

  //Kiểm tra điện thoại có thể bán hay không
  bool kiemTraCoTheBan() {
    if (_trangThai == true && _soLuongTonKho > 0) {
      return true;
    }
    return false;
  }
}
