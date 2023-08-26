class MonitoringModel {
  Meta? meta;
  List<Data>? data;

  MonitoringModel({this.meta, this.data});

  MonitoringModel.fromJson(Map<String, dynamic> json) {
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
  String? controlIdUnique;
  String? nodeIdUnique;
  String? nodeName;
  List<Sensor>? sensor;

  Data(
      {this.id,
      this.controlIdUnique,
      this.nodeIdUnique,
      this.nodeName,
      this.sensor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    controlIdUnique = json['control_id_unique'];
    nodeIdUnique = json['node_id_unique'];
    nodeName = json['node_name'];
    if (json['sensor'] != null) {
      sensor = <Sensor>[];
      json['sensor'].forEach((v) {
        sensor!.add(Sensor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['control_id_unique'] = controlIdUnique;
    data['node_id_unique'] = nodeIdUnique;
    data['node_name'] = nodeName;
    if (sensor != null) {
      data['sensor'] = sensor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sensor {
  String? sensorIdUnique;
  String? sensorName;
  String? nodeId;
  String? soilMoisture;

  Sensor(
      {this.sensorIdUnique, this.sensorName, this.nodeId, this.soilMoisture});

  Sensor.fromJson(Map<String, dynamic> json) {
    sensorIdUnique = json['sensor_id_unique'];
    sensorName = json['sensor_name'];
    nodeId = json['node_id'];
    soilMoisture = json['soil_moisture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sensor_id_unique'] = sensorIdUnique;
    data['sensor_name'] = sensorName;
    data['node_id'] = nodeId;
    data['soil_moisture'] = soilMoisture;
    return data;
  }
}
