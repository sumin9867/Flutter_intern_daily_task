import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class CastList extends StatelessWidget {
  final List<CastEntity> casts;

  const CastList({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (casts.isEmpty) {
      return const Center(child: Text('No cast available'));
    } else {
      return SizedBox(
        height: ScreenSize.getScreenHeight(context) * .22,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: casts.length,
          itemBuilder: (context, index) {
            final cast = casts[index];
            return SizedBox(
              width: ScreenSize.getScreenWidth(context) * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cast.posterPath != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiConstants.BASE_IMAGE_URL}${cast.posterPath}',
                        width: ScreenSize.getScreenWidth(context) * 0.2,
                      ),
                    )
                  else
                    (Icon(
                      Icons.person,
                      color: Colors.white,
                      size: ScreenSize.getScreenHeight(context) * .14,
                    )),
                  SizedBox(height: ScreenSize.getScreenHeight(context) * .010),
                  Text(cast.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: NormalText.style),
                  const SizedBox(height: 4),
                  Text(
                    cast.character,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 203, 203, 203),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
