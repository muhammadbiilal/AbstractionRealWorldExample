class ProductModel {
  final String title;
  final String body;

  ProductModel({required this.title, required this.body});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      body: json['body'],
    );
  }
}
