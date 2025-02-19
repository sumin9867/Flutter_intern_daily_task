import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tryapi/data/data/remote_data_impl.dart';
import 'package:tryapi/data/reposiatory/estore_repo_impl.dart';
import 'package:tryapi/data/reposiatory/remote_data.dart';
import 'package:tryapi/domain/enitites/apimodel.dart';
import 'package:tryapi/domain/repository/estore_repo.dart';
import 'package:tryapi/domain/usecase/get_data.dart';

import 'package:tryapi/presentation/cubit/cubit.dart';

import 'package:tryapi/presentation/pages/home.dart';

void main() {
  RemoteData remoteData = RemoteDataImpl();
  EstoreRepo estoreRepo = EstoreRepoImpl(remoteData: remoteData);
  GetData getData = GetData(estoreRepo: estoreRepo);
  ApiCubit apiCubit = ApiCubit(getData);
  runApp(MyApp(
    apiCubit: apiCubit,
  ));
}

class MyApp extends StatelessWidget {
  ApiCubit apiCubit;
  MyApp({
    Key? key,
    required this.apiCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => apiCubit..getdata(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
