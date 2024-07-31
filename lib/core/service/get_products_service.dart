import '../../models/products_model.dart';
import 'api_service.dart';

class GetProductsService {
  final ApiService apiService = ApiService();
  Future<List<ProductsModel>> getAllProducts() async {
    var response = await apiService.get();
    List<dynamic> data = response.data;
    List<ProductsModel> product =
        data.map((e) => ProductsModel.fromJson(e)).toList();

    return product;
  }
}
