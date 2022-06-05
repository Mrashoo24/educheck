class UserModel {
  String? reference_id,user_name,
      user_email,
      user_gender_id,
      user_pincode_id,
      user_application_type,
      user_age_id,
      user_mo_num,
      user_url,
      user_refer_id,
      Operating_sys,
      Screen_size_id,
      Screen_reso_id, referralName,referralNumber,user_address,idproof,pancard,gst;


  UserModel({
    this.reference_id,
    this.user_name,
    this.user_email,
    this.user_gender_id,
    this.user_pincode_id,
    this.user_application_type,
    this.user_age_id,
    this.user_mo_num,
    this.user_url,
    this.user_refer_id,
    this.Operating_sys,
    this.Screen_size_id,
    this.Screen_reso_id,
    this.referralName,
    this.referralNumber,
    this.gst,
    this.idproof,
    this.pancard,
    this.user_address
  });

  fromJson(Map<String, dynamic> json) {
    return UserModel(
        user_name: json["user_name"],
        user_email: json["user_email"],
        user_gender_id: json["user_gender_id"],
        user_pincode_id: json["user_pincode_id"],
        user_application_type: json["user_application_type"],
        user_age_id: json["user_age_id"],
        user_mo_num: json["user_mo_num"],
        user_url: json["user_url"],
        Operating_sys: json["Operating_sys"],
        Screen_size_id: json["Screen_size_id"],
        Screen_reso_id: json["Screen_reso_id"],
        user_refer_id:json["user_refer_id"],
      reference_id: json['reference_id'],

      user_address: json["user_address"],
      referralNumber: json["referralNumber"],
      gst: json["gst"],
      pancard: json["pancard"],
      referralName: json["referralName"],
      idproof:json["idproof"],
    );
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['user_name'] = this.user_name;
    data['user_email'] = this.user_email;
    data['user_gender_id'] = this.user_gender_id;
    data['user_pincode_id'] = this.user_pincode_id;
    data['user_application_type'] = this.user_application_type;
    data['user_age_id'] = this.user_age_id;
    data['user_mo_num'] = this.user_mo_num;
    data['user_url'] = this.user_url;
    data['Operating_sys'] = this.Operating_sys;
    data['Screen_size_id'] = this.Screen_size_id;
    data['Screen_reso_id'] = this.Screen_reso_id;

    data['user_address'] = this.user_address;
    data['referralNumber'] = this.referralNumber;
    data['gst'] = this.gst;
    data['pancard'] = this.pancard;
    data['referralName'] = this.referralName;
    data['idproof'] = this.idproof;
    data['reference_id'] = this.reference_id;
    return data;

  }
}