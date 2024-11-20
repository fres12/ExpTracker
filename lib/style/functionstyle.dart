import 'package:flutter/material.dart';
import '../style/app_style.dart';

TextStyle getStyleForSisa(String sisa) {
  // Membandingkan sisa dengan kategori (sementara)
  if (sisa == 'rendah') {
    return AppStyle.sisarendah;
  } else if (sisa == 'sedang') {
    return AppStyle.sisasedang;
  } else if (sisa == 'bagus') {
    return AppStyle.sisabagus;
  } else if (sisa == 'exp') {
    return AppStyle.sisaexp;
  } else {
    return AppStyle.sisarendah;
  }
}
