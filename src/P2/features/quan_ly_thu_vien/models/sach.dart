class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  String _trangThaiMuon;

  //Constructors
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThaiMuon);

  //Getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  String get trangThaiMuon => _trangThaiMuon;

  //Setters
  set maSach(String maSach) {
    if (maSach.isNotEmpty) {
      _maSach = maSach;
    }
  }

  set tenSach(String tenSach) {
    if (tenSach.isNotEmpty) {
      _tenSach = tenSach;
    }
  }

  set tacGia(String tacGia) {
    if (tacGia.isNotEmpty) {
      _tacGia = tacGia;
    }
  }

  set trangThaiMuon(String trangThaiMuon) {
    _trangThaiMuon = trangThaiMuon;
  }

  void hienThiThongTin() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái mượn: $_trangThaiMuon');
  }
}
