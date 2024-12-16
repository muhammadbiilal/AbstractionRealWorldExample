import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';
import 'api_service.dart';

class ProductApiService extends ApiService<ProductModel> {
  @override
  Future<List<ProductModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception("Failed to load product data");
    }
  }
}
