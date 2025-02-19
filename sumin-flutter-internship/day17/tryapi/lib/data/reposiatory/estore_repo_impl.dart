import 'package:tryapi/data/reposiatory/remote_data.dart';
import 'package:tryapi/domain/enitites/apimodel.dart';
import 'package:tryapi/domain/repository/estore_repo.dart';

class EstoreRepoImpl extends EstoreRepo {
  RemoteData remoteData;
  EstoreRepoImpl({
    required this.remoteData,
  });
  @override
  Future<List<ApiModel>> getFetchedData() async {
    try {
      final prouct = await remoteData.getData();

      return prouct;
    } catch (e) {
      rethrow;
    }
  }
}
