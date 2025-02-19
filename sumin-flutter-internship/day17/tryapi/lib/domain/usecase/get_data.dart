import 'package:tryapi/domain/enitites/apimodel.dart';
import 'package:tryapi/domain/repository/estore_repo.dart';

class GetData {
  final EstoreRepo estoreRepo;

  GetData({required this.estoreRepo});

  Future<List<ApiModel>> call() async {
    return await estoreRepo.getFetchedData();
  }
}
