import 'dien_thoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKH;

  //Constructors
  HoaDon(
      this._maHoaDon,
      this._ngayBan,
      this._dienThoaiDuocBan,
      this._soLuongMua,
      this._giaBanThucTe,
      this._tenKhachHang,
      this._soDienThoaiKH);
  //Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKH => _soDienThoaiKH;
  //Setters
  set maHoaDon(String maHoaDon) {
    RegExp regExp = RegExp(r'^HD-\d{3}$');
    if (maHoaDon.isNotEmpty && regExp.hasMatch(maHoaDon)) {
      _maHoaDon = maHoaDon;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua < _dienThoaiDuocBan.soLuongTonKho) {
      _soLuongMua = soLuongMua;
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    }
  }

  set soDienThoaiKH(String soDienThoaiKH) {
    //Sử dụng RegExp để kiểm tra định dạng của số điện thoại
    RegExp regExp = RegExp(r'^0\d{9}$');
    if (regExp.hasMatch(soDienThoaiKH) && soDienThoaiKH.isNotEmpty) {
      _soDienThoaiKH = soDienThoaiKH;
    }
  }

  //Tính tổng tiền cho hóa đơn
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  //Tính lợi nhuận thực tế
  double tinhLoiNhuan() =>
      (_giaBanThucTe - _dienThoaiDuocBan.giaNhap) * soLuongMua;

  //Hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại được bán: ${_dienThoaiDuocBan.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Gía bán thực tế: $_giaBanThucTe');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách hàng: $_soDienThoaiKH\n');
  }
}
