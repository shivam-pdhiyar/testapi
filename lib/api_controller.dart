import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testapi/post_api.dart';
import 'package:testapi/toast.dart';
import 'apiconstant.dart';
import 'http_handler.dart';
import 'loading_dilog.dart';
import 'package:testapi/main.dart';

class ApiController {
  List userList = [];

  Future doLogin({isLoader = false, String? email, String? password, BuildContext? context}) async {
    if (isLoader) {
      showLoadingDialog(context: context!);
    }
    try {
      var res = await HttpHandler.postHttpMethod(
        url: APIEndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (res["error"] == null) {
        if (isLoader) {
          hideLoadingDialog(context: context!);
        }
        var data = jsonDecode(res["body"]);
        debugPrint("-----data----$data");
        pref!.setString("token", data["token"]);
        pref!.getString("token");
        Navigator.pushAndRemoveUntil(
            context!,
            MaterialPageRoute(
              builder: (context) => const PostApi(),
            ),
            (route) => false);
        showToast(
          toastMessage: "Login Successfully",
        );
      } else {
        if (isLoader) {
          hideLoadingDialog(context: context!);
        }
      }
    } catch (e) {
      showErrorToast(toastMessage: "error --------> $e");
      if (isLoader) {
        // ignore: use_build_context_synchronously
        hideLoadingDialog(context: context!);
      }
    }
  }



  Future register({isLoader = false, String? name, String? email, String? password, BuildContext? context}) async {
    if (isLoader) {
      showLoadingDialog(context: context!);
    }
    try {
      var response = await HttpHandler.postHttpMethod(
        url: APIEndPoints.register,
        data: {"name": name, "email": email, "password": password},
      );
      if (response['error'] == null) {
        if (isLoader) {
          // ignore: use_build_context_synchronously
          hideLoadingDialog(context: context!);
        }
        var data = jsonDecode(response["body"]);
        debugPrint("------Do-Register-Data----$data");
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context!,
            MaterialPageRoute(
              builder: (context) => const PostApi(),
            ),
            (route) => false);
        showToast(toastMessage: "Register Successfully");
      } else {
        if (isLoader) {
          // ignore: use_build_context_synchronously
          hideLoadingDialog(context: context!);
          var data1 = jsonDecode(response["body"]);
          showErrorToast(toastMessage: "${data1["msg"]}");
        }
        debugPrint("------else----");
        showErrorToast(toastMessage: jsonDecode(response["body"])["error"]);
      }
    } catch (e) {
      debugPrint("------Error----$e");
      if (isLoader) {
        // ignore: use_build_context_synchronously
        hideLoadingDialog(context: context!);
      }
    }
  }

  Future userData({String? name, String? job, BuildContext? context}) async {
    try {
      var res = await HttpHandler.postHttpMethod(url: APIEndPoints.postApi, data: {"name": name, "job": job});
      if (res["error"] == null) {
        var data = jsonDecode(res["body"]);
        debugPrint("List Data = $userList");
        debugPrint("data = ${data.toString()}");
        return data;
      } else {
        debugPrint("----else Error---->>>-- ");
      }
    } catch (e) {
      debugPrint("----Catch Error---->>>-- $e");
    }
  }

  Future delete({String? name, String? job, BuildContext? context}) async {
    try {
      var res = await HttpHandler.postHttpMethod(url: APIEndPoints.postApi, data: {"name": name, "job": job});
      if (res["error"] == null) {
        var data = jsonDecode(res["body"]);
        debugPrint("List Data = $userList");
        debugPrint("data = ${data.toString()}");
        return data;
      } else {
        debugPrint("----else Error---->>>-- ");
      }
    } catch (e) {
      debugPrint("----Catch Error---->>>-- $e");
    }
  }
}
