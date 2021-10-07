import 'package:e_c_shop/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}