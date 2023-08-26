class ControlModel {
  Meta? meta;
  Data? data;

  ControlModel({this.meta, this.data});

  ControlModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? idUnique;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Relay>? relay;
  HumidityTemperature? humidityTemperature;

  Data(
      {this.id,
      this.idUnique,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.relay,
      this.humidityTemperature});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUnique = json['id_unique'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['relay'] != null) {
      relay = <Relay>[];
      json['relay'].forEach((v) {
        relay!.add(Relay.fromJson(v));
      });
    }
    humidityTemperature = json['humidity_temperature'] != null
        ? HumidityTemperature.fromJson(json['humidity_temperature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_unique'] = idUnique;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (relay != null) {
      data['relay'] = relay!.map((v) => v.toJson()).toList();
    }
    if (humidityTemperature != null) {
      data['humidity_temperature'] = humidityTemperature!.toJson();
    }
    return data;
  }
}

class Relay {
  int? id;
  String? idUnique;
  String? name;
  dynamic description;
  String? status;
  String? controlId;
  String? createdAt;
  String? updatedAt;

  Relay(
      {this.id,
      this.idUnique,
      this.name,
      this.description,
      this.status,
      this.controlId,
      this.createdAt,
      this.updatedAt});

  Relay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUnique = json['id_unique'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    controlId = json['control_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_unique'] = idUnique;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['control_id'] = controlId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class HumidityTemperature {
  int? id;
  String? humidity;
  String? temperature;
  String? controlId;
  String? createdAt;
  String? updatedAt;

  HumidityTemperature(
      {this.id,
      this.humidity,
      this.temperature,
      this.controlId,
      this.createdAt,
      this.updatedAt});

  HumidityTemperature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    humidity = json['humidity'];
    temperature = json['temperature'];
    controlId = json['control_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['humidity'] = humidity;
    data['temperature'] = temperature;
    data['control_id'] = controlId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
