import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({toastMessage, backgroundColor, fontSize}) async {
  await Fluttertoast.showToast(
    msg: toastMessage ?? "",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? Colors.white,
    textColor: Colors.white,
    fontSize: fontSize ?? 14,
  );
}

showErrorToast({toastMessage, backgroundColor, fontSize}) async {
  await Fluttertoast.showToast(
    msg: toastMessage ?? "",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? Colors.red,
    textColor: Colors.white,
    fontSize: fontSize ?? 14,
  );
}
