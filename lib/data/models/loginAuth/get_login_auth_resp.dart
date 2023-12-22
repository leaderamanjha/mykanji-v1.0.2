class GetLoginAuthResp {
  String? error;

  GetLoginAuthResp({this.error});

  GetLoginAuthResp.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  get token => null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (error != null) {
      data['error'] = error;
    }
    return data;
  }
}
