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
  String? monthOfBirth;
  String? gender;
  String? email;
  String? profilePhoto;
  String? stateCode;
  String? districtCode;
  String? subDistrictCode;
  String? villageCode;
  String? townCode;
  String? wardCode;
  String? pincode;
  String? address;
  String? kycPhoto;
  String? stateName;
  String? districtName;
  String? subdistrictName;
  String? villageName;
  String? townName;
  String? wardName;
  List<String>? authMethods;
  String? verificationStatus;
  String? verificationType;
  String? clientId;
  String? phrAddress;

  ABHAProfileModel({
    this.healthIdNumber,
    this.healthId,
    this.mobile,
    this.firstName,
    this.middleName,
    this.lastName,
    this.name,
    this.yearOfBirth,
    this.dayOfBirth,
    this.monthOfBirth,
    this.gender,
    this.email,
    this.profilePhoto,
    this.stateCode,
    this.districtCode,
    this.subDistrictCode,
    this.villageCode,
    this.townCode,
    this.wardCode,
    this.pincode,
    this.address,
    this.kycPhoto,
    this.stateName,
    this.districtName,
    this.subdistrictName,
    this.villageName,
    this.townName,
    this.wardName,
    this.authMethods,
    this.verificationStatus,
    this.verificationType,
    this.clientId,
    this.phrAddress,
  });

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
    monthOfBirth = json['monthOfBirth'];
    gender = json['gender'];
    email = json['email'];
    profilePhoto = json['profilePhoto'];
    stateCode = json['stateCode'];
    districtCode = json['districtCode'];
    subDistrictCode = json['subDistrictCode'];
    villageCode = json['villageCode'];
    townCode = json['townCode'];
    wardCode = json['wardCode'];
    pincode = json['pincode'];
    address = json['address'];
    kycPhoto = json['kycPhoto'];
    stateName = json['stateName'];
    districtName = json['districtName'];
    subdistrictName = json['subdistrictName'];
    villageName = json['villageName'];
    townName = json['townName'];
    wardName = json['wardName'];
    authMethods = json['authMethods'].cast<String>();
    verificationStatus = json['verificationStatus'];
    verificationType = json['verificationType'];
    clientId = json['clientId'];
    phrAddress = json['phrAddress'];
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
    data['monthOfBirth'] = monthOfBirth;
    data['gender'] = gender;
    data['email'] = email;
    data['profilePhoto'] = profilePhoto;
    data['stateCode'] = stateCode;
    data['districtCode'] = districtCode;
    data['subDistrictCode'] = subDistrictCode;
    data['villageCode'] = villageCode;
    data['townCode'] = townCode;
    data['wardCode'] = wardCode;
    data['pincode'] = pincode;
    data['address'] = address;
    data['kycPhoto'] = kycPhoto;
    data['stateName'] = stateName;
    data['districtName'] = districtName;
    data['subdistrictName'] = subdistrictName;
    data['villageName'] = villageName;
    data['townName'] = townName;
    data['wardName'] = wardName;
    data['authMethods'] = authMethods;
    data['verificationStatus'] = verificationStatus;
    data['verificationType'] = verificationType;
    data['clientId'] = clientId;
    data['phrAddress'] = phrAddress;
    return data;
  }
}
