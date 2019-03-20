class CityEntity {
	String cityName;
	String cityCode;
	int pid;
	int iId;
	int id;

	CityEntity({this.cityName, this.cityCode, this.pid, this.iId, this.id});

	CityEntity.fromJson(Map<String, dynamic> json) {
		cityName = json['city_name'];
		cityCode = json['city_code'];
		pid = json['pid'];
		iId = json['_id'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['city_name'] = this.cityName;
		data['city_code'] = this.cityCode;
		data['pid'] = this.pid;
		data['_id'] = this.iId;
		data['id'] = this.id;
		return data;
	}
}
