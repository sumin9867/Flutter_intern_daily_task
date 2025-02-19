import 'package:tryapi/domain/enitites/apimodel.dart';

abstract class EstoreRepo {
  Future<List<ApiModel>> getFetchedData();
}
