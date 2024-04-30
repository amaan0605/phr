import 'package:get/get.dart';
import 'package:phr_app/pages/OCR/api.dart';
import 'package:phr_app/services/base_client.dart';
import 'dart:developer';

enum DataState { loading, complete }

class LoginInitResponseModel {
  String? txnId;

  LoginInitResponseModel({this.txnId});

  LoginInitResponseModel.fromJson(Map<String, dynamic> json) {
    txnId = json['txnId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['txnId'] = txnId;
    return data;
  }
}

class LoginInitRequestModel {
  String? healthid;

  LoginInitRequestModel({this.healthid});

  LoginInitRequestModel.fromJson(Map<String, dynamic> json) {
    healthid = json['healthid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['healthid'] = healthid;
    return data;
  }
}

/*
export interface ABHAProfile {
    healthIdNumber: string
    healthId: any
    mobile: string
    firstName: string
    middleName: string
    lastName: string
    name: string
    yearOfBirth: string
    dayOfBirth: string
    monthOfBirth: string
    gender: string
    email: any
    profilePhoto: string
    stateCode: string
    districtCode: string
    subDistrictCode: any
    villageCode: any
    townCode: any
    wardCode: any
    pincode: string
    address: string
    kycPhoto: any
    stateName: string
    districtName: string
    subdistrictName: any
    villageName: any
    townName: string
    wardName: any
    authMethods: string[]
    tags: {}
    kycVerified: boolean
    verificationStatus: any
    verificationType: any
    phrAddress: any
    emailVerified: boolean
}
*/
class ABHAProfileModel {
  String? healthIdNumber;
  String? healthId;
  String? mobile;
  String? firstName;
  String? middleName;
  String? lastName;
  String? name;
  String? yearOfBirth;
  String? dayOfBirth;

  ABHAProfileModel(
      {this.healthIdNumber,
      this.healthId,
      this.mobile,
      this.firstName,
      this.middleName,
      this.lastName,
      this.name,
      this.yearOfBirth,
      this.dayOfBirth});

  ABHAProfileModel.fromJson(Map<String, dynamic> json) {
    healthIdNumber = json['healthIdNumber'];
    healthId = json['healthId'];
    mobile = json['mobile'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    name = json['name'];
    yearOfBirth = json['yearOfBirth'];
    dayOfBirth = json['dayOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['healthIdNumber'] = healthIdNumber;
    data['healthId'] = healthId;
    data['mobile'] = mobile;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['name'] = name;
    data['yearOfBirth'] = yearOfBirth;
    data['dayOfBirth'] = dayOfBirth;
    return data;
  }
}

class LoginResponseModel {
  String? token;
  int? expiresIn;
  String? refreshToken;
  int? refreshExpiresIn;

  LoginResponseModel(
      {this.token, this.expiresIn, this.refreshToken, this.refreshExpiresIn});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expiresIn'];
    refreshToken = json['refreshToken'];
    refreshExpiresIn = json['refreshExpiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiresIn'] = expiresIn;
    data['refreshToken'] = refreshToken;
    data['refreshExpiresIn'] = refreshExpiresIn;
    return data;
  }
}

class LoginInitController extends GetxController {
  var state = DataState.loading.obs;
  var errorString = '';

  ///LOGIN DETAILS
  LoginInitResponseModel? loginInitResponseModel;
  static String aadharAuthInitURL = "$PHR_ENDPOINT/login/aadhaar/authinit";

  setLoginTxn({LoginInitResponseModel? loginInitResponse}) {
    if (loginInitResponse == null) return;
    loginInitResponseModel = loginInitResponse;
  }

  getLoginResponse() {
    return loginInitResponseModel;
  }

  Future<void> postInitAuth({LoginInitRequestModel? loginDetails}) async {
    if (loginDetails == null) state.value = DataState.loading;
    final value =
        await BaseClient(url: aadharAuthInitURL, body: loginDetails).post();
    log("Post Login Details ${loginDetails?.healthid} ");
    if (value == null) {
    } else {
      LoginInitResponseModel loginInitResponseModel =
          LoginInitResponseModel.fromJson(value);
      setLoginTxn(loginInitResponse: loginInitResponseModel);
    }

    state.value = DataState.complete;
  }

  Future<LoginResponseModel> postOTPConfirm(
      {String? txnId, String? otp}) async {
    if (txnId == null || otp == null) state.value = DataState.loading;
    final value = await BaseClient(
      url: "$PHR_ENDPOINT/login/aadhaar/confirm-with-aadhaar-otp",
      body: {"txnid": txnId, "otp": otp},
    ).post(); // TODO: make I capital in txnid and server
    log("Post Login Details $txnId ");
    if (value == null) {
      log("Post Login Details $txnId ");
      throw Exception("Error in OTP Confirmation");
    } else {
      log("Post Login Details $txnId $value ");
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(value);
      state.value = DataState.complete;
      return loginResponseModel;
    }
  }

  Future<ABHAProfileModel> getProfile(String xToken) async {
    final value = await BaseClient(
      url: "$PHR_ENDPOINT/getProfile",
      body: {"X_Token": xToken},
    ).post();
    log("Get Profile $value ");
    if (value == null) {
      log("Get Profile $value ");
      throw Exception("Error in OTP Confirmation");
    } else {
      log("Get Profile $value ");
      state.value = DataState.complete;
      return ABHAProfileModel.fromJson(value);
    }
  }

  @override
  refresh() async {
    errorString = '';
    loginInitResponseModel = null;
  }
}
