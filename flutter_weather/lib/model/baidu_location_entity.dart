class BaiduLocationEntity {
	BaiduLocationResult result;
	String status;

	BaiduLocationEntity({this.result, this.status});

	BaiduLocationEntity.fromJson(Map<String, dynamic> json) {
		result = json['result'] != null ? new BaiduLocationResult.fromJson(json['result']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] = this.result.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class BaiduLocationResult {
	String formattedAddress;
	String business;
	int citycode;
	BaiduLocationResultLocation location;
	BaiduLocationResultAddresscomponent addresscomponent;

	BaiduLocationResult({this.formattedAddress, this.business, this.citycode, this.location, this.addresscomponent});

	BaiduLocationResult.fromJson(Map<String, dynamic> json) {
		formattedAddress = json['formatted_address'];
		business = json['business'];
		citycode = json['cityCode'];
		location = json['location'] != null ? new BaiduLocationResultLocation.fromJson(json['location']) : null;
		addresscomponent = json['addressComponent'] != null ? new BaiduLocationResultAddresscomponent.fromJson(json['addressComponent']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['formatted_address'] = this.formattedAddress;
		data['business'] = this.business;
		data['cityCode'] = this.citycode;
		if (this.location != null) {
      data['location'] = this.location.toJson();
    }
		if (this.addresscomponent != null) {
      data['addressComponent'] = this.addresscomponent.toJson();
    }
		return data;
	}
}

class BaiduLocationResultLocation {
	double lng;
	double lat;

	BaiduLocationResultLocation({this.lng, this.lat});

	BaiduLocationResultLocation.fromJson(Map<String, dynamic> json) {
		lng = json['lng'];
		lat = json['lat'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lng'] = this.lng;
		data['lat'] = this.lat;
		return data;
	}
}

class BaiduLocationResultAddresscomponent {
	String distance;
	String province;
	String city;
	String street;
	String district;
	String streetNumber;
	String direction;

	BaiduLocationResultAddresscomponent({this.distance, this.province, this.city, this.street, this.district, this.streetNumber, this.direction});

	BaiduLocationResultAddresscomponent.fromJson(Map<String, dynamic> json) {
		distance = json['distance'];
		province = json['province'];
		city = json['city'];
		street = json['street'];
		district = json['district'];
		streetNumber = json['street_number'];
		direction = json['direction'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['distance'] = this.distance;
		data['province'] = this.province;
		data['city'] = this.city;
		data['street'] = this.street;
		data['district'] = this.district;
		data['street_number'] = this.streetNumber;
		data['direction'] = this.direction;
		return data;
	}
}
