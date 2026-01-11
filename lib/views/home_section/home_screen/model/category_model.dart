class CategoryModel {
  final String id;
  final String title;
  final String iconUrl;

  CategoryModel({
    required this.id,
    required this.title,
    required this.iconUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      title: json['name'] as String,
      iconUrl: json['image_url'] as String,
    );
  }
}
