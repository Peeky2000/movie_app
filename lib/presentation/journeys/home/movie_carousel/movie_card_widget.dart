import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    super.key,
    required this.movieId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 32,
      child: GestureDetector(
        onTap: (){

        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
