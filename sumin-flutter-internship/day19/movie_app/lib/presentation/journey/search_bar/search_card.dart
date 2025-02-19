import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_Detail_arguement/movie_detail_argument.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class SearchCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const SearchCard({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MovieDetailScreen(
              movieDetailArguments:
                  MovieDetailArguments(movieId: movieEntity.id),
            );
          }));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.getScreenWidth(context) * .06,
              vertical: ScreenSize.getScreenHeight(context) * .017),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.BASE_IMAGE_URL}${movieEntity.posterPath}',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: ScreenSize.getScreenWidth(context) * .3,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenSize.getScreenWidth(context) * .04,
                    right: ScreenSize.getScreenWidth(context) * .04,
                    bottom: ScreenSize.getScreenHeight(context) * .07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenSize.getScreenWidth(context) * .5,
                      child: Text(
                        movieEntity.title,
                        overflow: TextOverflow.ellipsis,
                        style: HeadlineText.style,
                      ),
                    ),
                    Gap(ScreenSize.getScreenHeight(context) * .01),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: AppColor.iconColour,
                        ),
                        Gap(ScreenSize.getScreenWidth(context) * .01),
                        Text(
                          movieEntity.voteAverage.toStringAsFixed(1),
                          overflow: TextOverflow.ellipsis,
                          style: HeadlineDetailsearch.style,
                        ),
                      ],
                    ),
                    Gap(ScreenSize.getScreenHeight(context) * .006),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                        Gap(ScreenSize.getScreenWidth(context) * .01),
                        Text(
                          movieEntity.releaseData,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: HeadlineDetail.style,
                        ),
                      ],
                    ),
                    Gap(ScreenSize.getScreenHeight(context) * .006),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        Gap(ScreenSize.getScreenWidth(context) * .01),
                        Text(
                          movieEntity.voteAverage.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: HeadlineDetail.style,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
