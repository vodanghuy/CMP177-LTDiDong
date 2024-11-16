import 'dart:io';

void main() {
  //Khai bao bien co ban
  var ten = 'Tung'; //Tu suy luan
  int tuoi = 25; //Khai bao ro rang

  //Su dung Null Safety
  String? tenNullable;
  tenNullable = null;

  // Su dung bien late
  late String moTa;
  moTa = 'Lap trinh Dart';

  //Su dung final va const
  final String quocGia = 'Viet Nam';
  const int nam = 2024;

  //In gia tri bien
  print('Ten: $ten');
  print('Tuoi: $tuoi');
  print('Mo ta: $moTa');
  print('Quoc gia: $quocGia');
  print('Nam: $nam');

  //Kiem tra bien nullable
  int? soLuong;
  assert(soLuong == null); //Dung toan bo chuong trinh neu dieu kien sai
}
