import 'package:flutter/material.dart';

void showLoadingDialog({BuildContext? context}) {
  showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void hideLoadingDialog({bool isTrue = false, BuildContext? context}) {
  Navigator.pop(context!);
}
