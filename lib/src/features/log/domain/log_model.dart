class LogModel {
  Meta? meta;
  List<Data>? data;

  LogModel({this.meta, this.data});

  LogModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? code;
  String? status;
  dynamic message;

  Meta({this.code, this.status, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? sensorId;
  String? soilMoisture;
  String? humidity;
  String? temperature;
  String? quarter;
  String? time;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.sensorId,
      this.soilMoisture,
      this.humidity,
      this.temperature,
      this.quarter,
      this.time,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sensorId = json['sensor_id'];
    soilMoisture = json['soil_moisture'];
    humidity = json['humidity'];
    temperature = json['temperature'];
    quarter = json['quarter'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensor_id'] = sensorId;
    data['soil_moisture'] = soilMoisture;
    data['humidity'] = humidity;
    data['temperature'] = temperature;
    data['quarter'] = quarter;
    data['time'] = time;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
