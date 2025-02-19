import 'package:flutter/material.dart';
import 'package:tryapi/domain/enitites/apimodel.dart';

class Detail extends StatelessWidget {
  final ApiModel data;

  const Detail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(children: [Image.network(data.thumbnail!), Text(data.title!)]),
    );
  }
}
