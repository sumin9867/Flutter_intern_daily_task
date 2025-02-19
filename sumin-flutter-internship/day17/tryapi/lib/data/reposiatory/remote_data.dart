import 'package:tryapi/data/model/estore_product_model.dart';

abstract class RemoteData {
  Future<List<EstoreProductModel>> getData();
}
