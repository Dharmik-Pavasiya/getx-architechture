class AddUserModel {
  const AddUserModel({
    required this.name,
    required this.job,
    required this.id,
  });

  final String name;
  final String job;
  final String id;

  factory AddUserModel.fromJson(Map<String, dynamic> json) {
    return AddUserModel(
      name: json['name'] as String? ?? '',
      job: json['job'] as String? ?? '',
      id: json['id']?.toString() ?? '',
    );
  }
}
