class DeviceInfo {
  String id;
  String name;
  String os;

  DeviceInfo({
    required this.id,
    required this.name,
    required this.os,
  });

  // ignore: missing_return
  Map<String, dynamic> toData() => {
        'id': id,
        'name': name,
        'os': os,
      };

  factory DeviceInfo.fromData(Map<dynamic, dynamic> data) {
    return DeviceInfo(
      id: data['id'],
      name: data['name'],
      os: data['os'],
    );
  }
}
