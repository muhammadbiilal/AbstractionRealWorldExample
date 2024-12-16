import '../models/product_model.dart';
import '../services/product_api_service.dart';

class ProductViewModel {
  final ProductApiService _service = ProductApiService();

  Future<List<ProductModel>> getProducts() async {
    return await _service.fetchData();
  }
}
