import 'dart:convert';
import 'dart:developer';

import 'package:phr_app/constants.dart';
import 'package:phr_app/pages/Login/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ABHAProfileModel?> getLocalAbhaProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final abhaProfile = prefs.getString(spProfileKey);
  log('abhaProfile: $abhaProfile');
  if (abhaProfile != null) {
    return ABHAProfileModel.fromJson(jsonDecode(abhaProfile));
  }
  return null;
}
