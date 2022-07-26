class Device {
  final int id;
  final String name;
  final String code;
  final String type;

  const Device({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'].toString(),
      type: ' ',
    );
  }
}

