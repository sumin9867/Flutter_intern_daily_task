import 'package:tryapi/data/model/estore_product_model.dart';

class EStoremodel {
  List<EstoreProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  EStoremodel({this.products, this.total, this.skip, this.limit});

  EStoremodel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <EstoreProductModel>[];
      json['products'].forEach((v) {
        products!.add(new EstoreProductModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}
