import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryapi/domain/enitites/apimodel.dart';
import 'package:tryapi/presentation/cubit/cubit.dart';
import 'package:tryapi/presentation/cubit/state.dart';
import 'package:tryapi/presentation/pages/detail.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("APi Testing")),
      body: BlocBuilder<ApiCubit, MyState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final ApiModel sumin = state.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(data: sumin)));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(sumin.thumbnail!),
                        ),
                        title: Text(sumin.title!),
                        subtitle: Text(sumin.description!),
                      ),
                    ),
                  );
                });
          } else if (state is ErrorState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
