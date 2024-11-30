import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:water_tracking/router/app_routes.dart';
import 'package:water_tracking/utils/channel.dart';
import 'package:water_tracking/utils/utils.dart';
import 'package:uuid/uuid.dart';

import '../../router/app_pages.dart';
import 'start_state.dart';

class StartLogic extends GetxController {
  final StartState state = StartState();

  void toPrivacy() {
    Get.toNamed(AppRoutes.startPage);
  }

  void toAgreement() {
    Get.toNamed(AppRoutes.startPage);
  }

  Future<void> toHome() async {
    await Utils().prefUtil.setValue<bool>('firstStart', false);
    if (Platform.isAndroid) {
      await setUuid();
      //await Utils().supabaseUtil.initSupabase();
      //await Utils().updateUtil.initShiply();
    }
    Get.offAllNamed(AppRoutes.homePage);
  }

  Future<void> setUuid() async {
    var oaid = await OAIDChannel.getOAID();
    if (oaid != null) {
      await Utils().prefUtil.setValue<String>('uuid', md5.convert(utf8.encode(oaid)).toString());
    } else {
      await Utils().prefUtil.setValue<String>('uuid', md5.convert(utf8.encode(const Uuid().v7())).toString());
    }
  }
}
