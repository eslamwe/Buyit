import 'package:e_c_shop/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCatergories();
}