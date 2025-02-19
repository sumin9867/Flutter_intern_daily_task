import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/cubit/apicall_cubit.dart';
import 'package:news_app/presentation/cubit/apicall_state.dart';
import 'package:news_app/domain/entity/news_model.dart';

import 'crard_tile.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiCallCubit, ApiCallState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        if (state is LoadingDataFetching) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorDataFetching) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "An error occurred: ${state.errorMessage}"), // Display error message
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ApiCallCubit>(context)
                        .getDataCubit(); // Retry fetching data
                  },
                  child: Text("Retry"),
                ),
              ],
            ),
          );
        } else if (state is ResponseDataFetching) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.newsArticle.length,
                itemBuilder: (_, int index) {
                  final NewsArticle article = state.newsArticle[index];
                  return CardTile(article: article);
                },
              ),
            ),
          );
        }
        return SizedBox
            .shrink(); // Provides an empty widget when there's no data
      },
    );
  }
}
