import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/colour.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/presentation/cubit/apicall_cubit.dart';
import 'package:news_app/presentation/cubit/apicall_state.dart';
import 'package:news_app/presentation/widgets/appbar.dart';
import 'package:news_app/presentation/widgets/card_list.dart';
import 'package:news_app/presentation/widgets/news_list.dart';
import 'package:news_app/domain/entity/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ApiCallCubit>().getDataCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBar(),
      body: Material(
        color: backgroudColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.07, top: 16.0),
                child: const Text(
                  "Top Headlines",
                  style: Headline2.style,
                ),
              ),
              const CardListView(),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.08, top: 16.0),
                child: const Text(
                  "More News",
                  style: Headline2.style,
                ),
              ),
              BlocBuilder<ApiCallCubit, ApiCallState>(
                builder: (context, state) {
                  if (state is ResponseDataFetching) {
                    return NewsList(
                      newsFuture: Future.value(state.newsArticle),
                    );
                  } else if (state is ErrorDataFetching) {
                    return const Center(child: Text("Failed to load news."));
                  } else if (state is LoadingDataFetching) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text("No news available."));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
