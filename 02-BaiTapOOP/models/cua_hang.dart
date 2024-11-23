import 'dart:io';

import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> dsDienThoai = [];
  List<HoaDon> dsHoaDon = [];

  //Constructors
  CuaHang(this._tenCuaHang, this._diaChi);

  //Các phương thức quản lý điện thoại

  //Thêm điện thoại
  void themDienThoai(DienThoai dt) {
    dsDienThoai.add(dt);
  }

  //Cập nhật thông tin điện thoại
  void capNhatThongTinDienThoai(DienThoai dt) {
    String input;
    int chon;
    double tmp;
    //Gán giá trị mã điện thoại ban đầu cho bienTam
    String bienTam = dt.maDienThoai;
    do {
      print('1: Mã điện thoại');
      print('2: Tên điện thoại');
      print('3: Hãng sản xuất');
      print('4: Gía nhập');
      print('5: Gía bán');
      print('6: Trạng thái');
      print('0: Thoát');
      stdout.write('Chọn thông tin cần cập nhật: ');
      input = stdin.readLineSync() ?? '';
      chon = int.tryParse(input!) ?? -1;
      if (chon < 0 || chon > 6) {
        print('Không hợp lệ, chọn lại');
      } else {
        switch (chon) {
          case 1:
            do {
              stdout.write('Nhập mã điện thoại mới (Định dạng: DT-XXX): ');
              input = stdin.readLineSync() ?? '';
              if (input.isEmpty) {
                print('Số điện thoại không thể rỗng');
              } else {
                dt.maDienThoai = input;
                //Kiểm tra biến maDienThoai sau khi gán giá trị input nếu vẫn còn giá trị ban đầu thì báo lỗi
                if (dt.maDienThoai == bienTam) {
                  print('Mã không đúng định dạng, nhập lại');
                } else {
                  print('\nCập nhật thành công!');
                }
              }
            } while (input == null || dt.maDienThoai == bienTam);
            break;
          case 2:
            do {
              stdout.write('Nhập tên điện thoại mới: ');
              input = stdin.readLineSync() ?? '';
              if (input.isEmpty) {
                print('Tên điện thoại không được rỗng!');
              } else {
                print('Cập nhật thông tin thành công!');
                dt.tenDienThoai = input;
              }
            } while (input.isEmpty);
            break;
          case 3:
            do {
              stdout.write('Nhập hãng sản xuất mới: ');
              input = stdin.readLineSync() ?? '';
              if (input.isEmpty) {
                print('Hãng sản xuất không được rỗng!');
              } else {
                dt.hangSanXuat = input;
                print('Cập nhật thông tin thành công!');
              }
            } while (input.isEmpty);
            break;
          case 4:
            do {
              stdout.write('Nhập giá nhập mới: ');
              input = stdin.readLineSync() ?? '';
              tmp = double.tryParse(input) ?? 0;
              if (input.isEmpty) {
                print('Giá nhập không được rỗng!');
              } else if (tmp <= 0) {
                print('Gía nhập không hợp lệ, nhập lại!');
              } else {
                dt.giaNhap = tmp;
                print('Cập nhật thành công');
              }
            } while (tmp <= 0 || input.isEmpty);
            break;
          case 5:
            do {
              print('Gía nhập: ${dt.giaNhap}');
              stdout.write('Nhập giá bán mới (giá bán > giá nhập): ');
              input = stdin.readLineSync() ?? '';
              tmp = double.tryParse(input) ?? 0;
              if (input.isEmpty) {
                print('Giá bán không được rỗng!');
              } else if (tmp < dt.giaNhap) {
                print('Gía bán không hợp lệ, nhập lại!');
              } else {
                dt.giaBan = tmp;
                print('Cập nhật thành công');
              }
            } while (tmp < dt.giaNhap || input.isEmpty);
            break;
          case 6:
            String chon2;
            if (dt.trangThai == true) {
              do {
                stdout.write(
                    'Bạn có muốn chuyển trạng thái thành "Không còn kinh doanh" (YES/NO): ');
                chon2 = stdin.readLineSync() ?? '';
                //Đưa chon2 thành ký tự hoa để không phân biệt hoa thường khi người dùng nhập
                switch (chon2.toUpperCase()) {
                  case 'YES':
                    dt.trangThai = false;
                    break;
                  case 'NO':
                    break;
                  default:
                    print('Trả lời không hợp lệ!');
                    break;
                }
              } while (dt.trangThai == true && chon2.toUpperCase() != 'NO');
            } else {
              do {
                stdout.write(
                    'Bạn có muốn chuyển trạng thái thành "còn kinh doanh" (YES/NO): ');
                chon2 = stdin.readLineSync() ?? '';
                switch (chon2.toUpperCase()) {
                  case 'YES':
                    dt.trangThai = true;
                    break;
                  case 'NO':
                    break;
                  default:
                    print('Trả lời không hợp lệ!');
                    break;
                }
              } while (dt.trangThai == false && chon2.toUpperCase() != 'NO');
            }
            break;
          case 0:
            break;
        }
      }
    } while (chon < 0 || chon > 6);
  }

  //Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(DienThoai dt) {
    //Lấy giá trị điện thoại có mã điện thoại tương ứng
    DienThoai dt1 =
        dsDienThoai.firstWhere((i) => i.maDienThoai == dt.maDienThoai);
    dt1.trangThai = false;
  }

  //Tìm kiếm điện thoại (theo mã, tên, hãng)
  int timKiemDienThoai(String string) {
    //Kiểm tra không phân biệt hoa thường chuỗi nhập vào và đưa vào danh sách mới
    List<DienThoai> dsdt = dsDienThoai
        .where((i) =>
            i.maDienThoai.toUpperCase() == string.toUpperCase() ||
            i.tenDienThoai.toUpperCase() == string.toUpperCase() ||
            i.hangSanXuat.toUpperCase() == string.toUpperCase())
        .toList();
    if (dsdt.isEmpty) {
      print('Không có điện thoại hợp lệ.');
      return 0;
    } else {
      for (var i in dsdt) {
        i.hienThiThongTin();
      }
      return 1;
    }
    return 1;
  }

  //Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var i in dsDienThoai) {
      print('Danh sách điện thoại của cửa hàng\n');
      i.hienThiThongTin();
    }
  }

  //Các phương thức quản lý hóa đơn

  //Tạo hóa đơn và cập nhật số lượng tồn
  void taoHoaDon(HoaDon hd) {
    dsHoaDon.add(hd);
    DienThoai dt = dsDienThoai
        .firstWhere((i) => i.maDienThoai == hd.dienThoaiDuocBan.maDienThoai);
    dt.soLuongTonKho -= hd.soLuongMua;
  }

  //Tìm kiếm hóa đơn(theo mã, ngày, khách hàng)
  int timKiemHoaDon(String s) {
    //Loại bỏ khoảng trống đầu câu và cuối câu (nếu có)
    s.trim();
    List<HoaDon> dshd = dsHoaDon
        .where((i) =>
            i.maHoaDon.toUpperCase() == s.toUpperCase() ||
            i.ngayBan == DateTime.tryParse(s) ||
            i.tenKhachHang.toUpperCase() == s.toUpperCase())
        .toList();
    if (dshd.isEmpty) {
      print('Không có hóa đơn hợp lệ!');
      return 0;
    } else {
      print('\nKết quả tìm kiếm:\n');
      for (var i in dshd) {
        i.hienThiThongTinHoaDon();
      }
      return 1;
    }
    return 0;
  }

  //Hiển thị danh sách hóa đơn
  void hienThiDanhSach() {
    for (var i in dsHoaDon) {
      i.hienThiThongTinHoaDon();
    }
  }

  //Các phương thức thống kê

  //Tính tổng doanh thu theo khoảng thời gian
  void tinhTongDoanhThu() {
    String input;
    DateTime? ngayBatDau, ngayKetThuc;
    do {
      stdout.write('Nhập ngày bắt đầu (yyyy-MM-dd): ');
      input = stdin.readLineSync() ?? '';
      if (input.isEmpty) {
        print('Không được để trống');
      } else {
        ngayBatDau = DateTime.tryParse(input);
        if (ngayBatDau == null) {
          print('Giá trị không hợp lệ!');
        }
      }
    } while (input.isEmpty || ngayBatDau == null);
    do {
      stdout.write('Nhập ngày kết thúc (yyyy-MM-dd): ');
      input = stdin.readLineSync() ?? '';
      if (input.isEmpty) {
        print('Không được để trống');
      } else {
        ngayKetThuc = DateTime.tryParse(input);
        if (ngayKetThuc == null) {
          print('Giá trị không hợp lệ!');
        }
      }
    } while (input.isEmpty || ngayKetThuc == null);
    double doanhThu = dsHoaDon
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau!.subtract(Duration(days: 1))) &&
            hd.ngayBan.isBefore(ngayKetThuc!.add(Duration(days: 1))))
        .fold(0, (sum, hd) => sum + hd.tinhTongTien());
    print(
        'Tổng doanh thu từ ngày $ngayBatDau đến ngày $ngayKetThuc: $doanhThu VND');
  }

  //Tính tổng lợi nhuận theo thời gian
  void tinhTongLoiNhuan() {
    String input;
    DateTime? ngayBatDau, ngayKetThuc;
    do {
      stdout.write('Nhập ngày bắt đầu (yyyy-MM-dd): ');
      input = stdin.readLineSync() ?? '';
      if (input.isEmpty) {
        print('Không được để trống');
      } else {
        ngayBatDau = DateTime.tryParse(input);
        if (ngayBatDau == null) {
          print('Giá trị không hợp lệ!');
        }
      }
    } while (input.isEmpty || ngayBatDau == null);
    do {
      stdout.write('Nhập ngày kết thúc (yyyy-MM-dd): ');
      input = stdin.readLineSync() ?? '';
      if (input.isEmpty) {
        print('Không được để trống');
      } else {
        ngayKetThuc = DateTime.tryParse(input);
        if (ngayKetThuc == null) {
          print('Giá trị không hợp lệ!');
        }
      }
    } while (input.isEmpty || ngayKetThuc == null);
    double doanhThu = dsHoaDon
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau!.subtract(Duration(days: 1))) &&
            hd.ngayBan.isBefore(ngayKetThuc!.add(Duration(days: 1))))
        .fold(0, (sum, hd) => sum + hd.tinhLoiNhuan());
    print(
        'Tổng doanh thu từ ngày $ngayBatDau đến ngày $ngayKetThuc: $doanhThu VND');
  }

  //Thống kê TOP điện thoại bán chạy
  void thongKeDienThoaiBanChay() {
    Map<String, int> sanPhamBanChay = {};
    for (var hd in dsHoaDon) {
      String maSanPham = hd.dienThoaiDuocBan.maDienThoai;
      int soLuongBanRa = hd.soLuongMua;
      if (sanPhamBanChay.containsKey(maSanPham)) {
        sanPhamBanChay[maSanPham] = sanPhamBanChay[maSanPham]! + soLuongBanRa;
      } else {
        sanPhamBanChay[maSanPham] = soLuongBanRa;
      }
    }
    var sapXepSanPham = sanPhamBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    print('\nDanh sách sản phẩm bán chạy:\n');
    for (var entry in sapXepSanPham) {
      print('Mã sản phẩm: ${entry.key} - Số lượng bán: ${entry.value}');
    }
  }

  //Thống kê tồn kho
  void thongKeTonKho() {
    print('\nBáo cáo tồn kho\n');
    for (var i in dsDienThoai) {
      print(
          'Mã điện thoại: ${i.maDienThoai} - Số lượng tồn kho: ${i.soLuongTonKho}');
    }
  }
}
