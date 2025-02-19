import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/dependency_injection.dart/get_it.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_detail_cubit/photo_detail_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_detail_cubit/photo_detail_state.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/big_poster.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/movie_detail_argument.dart';

class PhotoDetailScreen extends StatefulWidget {
  final PhotoDetailArguments photoDetailArguments;

  const PhotoDetailScreen({Key? key, required this.photoDetailArguments})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<PhotoDetailScreen> {
  late PhotoDetailCubit _photoDetailCubit;
  @override
  void initState() {
    super.initState();

    _photoDetailCubit = PhotoDetailCubit(getItInstance());
    _photoDetailCubit.getMovieDetailById(widget.photoDetailArguments.photoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _photoDetailCubit,
        child: BlocBuilder<PhotoDetailCubit, PhotoDetailState>(
          builder: (context, state) {
            if (state is PhotoDetailInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PhotoDetailLoaded) {
              final movieDetail = state.photoDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      photos: movieDetail,
                      id: movieDetail.id,
                    ),
                  ],
                ),
              );
            } else if (state is PhotoDetailError) {
              return const Center(child: Text("Error Getting detail"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
