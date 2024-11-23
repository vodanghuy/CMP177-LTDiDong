import 'dart:io';

import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

void main() {
  String input;
  int result;
  CuaHang cuaHang = CuaHang('Apple Store', '43 Thống Nhất');
  DienThoai dt =
      DienThoai('DT-001', 'Iphone 16', 'Apple', 20000000, 25000000, 10, false);
  DienThoai dt1 =
      DienThoai('DT-002', 'ZFold', 'SamSung', 20000000, 25000000, 10, true);
  DienThoai dt2 =
      DienThoai('DT-003', 'Iphone 11', 'Apple', 20000000, 25000000, 10, true);

  //----------Tạo và quản lý thông tin điện thoại----------

  // Thêm điện thoại mới
  cuaHang.themDienThoai(dt);
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  //Cập nhật thông tin
  print('\n----------Cập nhật thông tin điện thoại----------\n');
  cuaHang.capNhatThongTinDienThoai(dt);
  print('\nThông tin sau khi cập nhật\n');
  dt.hienThiThongTin();
  print('\n----------Kết thúc----------\n');

  //Kiểm tra validation
  print('\n----------Kiểm tra validation----------\n');
  print('Gán giá trị mới cho dt.maDienThoai là 001');
  dt.maDienThoai = '001';
  print('\nKết quả sau khi gán:\n');
  dt.hienThiThongTin();
  print(
      '\n=> Gía trị dt.maDienThoai không bị thay đổi vì định dạng không hợp lệ\n');
  print('Gán giá trị mới cho dt.maDienThoai là DT-008');
  dt.maDienThoai = 'DT-008';
  print('\nKết quả sau khi gán:\n');
  dt.hienThiThongTin();
  print('\n=> Gía trị dt.maDienThoai đã bị thay đổi vì định dạng hợp lệ\n');
  print('\n----------Kết thúc----------\n');

  //----------Tạo và quản lý hóa đơn----------

  //Tạo hóa đơn hợp lệ
  HoaDon hd = HoaDon('HD-001', DateTime.parse('2024-12-12'), dt2, 3, dt2.giaBan,
      'Nguyen Van A', '0865744837');
  HoaDon hd1 = HoaDon('HD-002', DateTime.parse('2024-11-03'), dt, 3, dt2.giaBan,
      'Nguyen Van A', '0865744837');
  cuaHang.taoHoaDon(hd);
  cuaHang.taoHoaDon(hd1);

  //Kiểm tra các ràng buộc (tồn kho, validation)
  print('\n----------Kiểm tra validation (tồn kho, validation)----------\n');
  print(
      '\nSố lượng tồn kho của điện thoại bị thay đổi sau khi hóa đơn mới được tạo:\n');
  dt2.hienThiThongTin();
  print('Gán giá trị mới cho hd.maHoaDon là 001');
  hd.maHoaDon = '001';
  print('\nKết quả sau khi gán:\n');
  hd.hienThiThongTinHoaDon();
  print('=> Gía trị hd.maHoaDon không bị thay đổi vì định dạng không hợp lệ\n');
  print('Gán giá trị mới cho hd.maHoaDon là HD-008');
  hd.maHoaDon = 'HD-008';
  print('\nKết quả sau khi gán:\n');
  hd.hienThiThongTinHoaDon();
  print('\n=> Gía trị hd.maHoaDon đã bị thay đổi vì định dạng hợp lệ\n');
  print('\n----------Kết thúc----------\n');

  //Tính toán tiền và lợi nhuận
  print('\n----------Tính toán tiền và lợi nhuận----------\n');
  print('Tổng tiền của hóa đơn HD-001: ${hd.tinhTongTien()}');
  print('Lợi nhuận của hóa đơn HD-001: ${hd.tinhLoiNhuan()}');
  print('\n----------Kết thúc----------\n');

  //----------Thống kê báo cáo----------

  //Doanh thu theo thời gian
  print('\n----------Doanh thu theo thời gian----------\n');
  cuaHang.tinhTongDoanhThu();
  print('\n----------Kết thúc----------\n');
  print('\n----------Lợi nhuận theo thời gian----------\n');
  cuaHang.tinhTongLoiNhuan();
  print('\n----------Kết thúc----------\n');
  print('\n----------Top bán chạy----------\n');
  cuaHang.thongKeDienThoaiBanChay();
  print('\n----------Kết thúc----------\n');
  print('\n----------Báo cáo tồn kho----------\n');
  cuaHang.thongKeTonKho();
  print('\n----------Kết thúc----------\n');
}
