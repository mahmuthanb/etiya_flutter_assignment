import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/constants.dart';
import '../../../model/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
    this.item,
    this.index,
    this.exactWidht, {
    Key? key,
  }) : super(key: key);

  final double exactWidht;
  final MovieModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () =>
          context.router.pushNamed("/movie-detail/${item.id.toString()}"),
      child: Container(
        margin: index == 0
            ? EdgeInsets.all(size.width * .025)
            : EdgeInsets.only(
                left: size.width * .025,
                right: size.width * .025,
                bottom: size.width * .025,
              ),
        padding: EdgeInsets.all(size.width * .025),
        height: size.height * .2,
        width: exactWidht,
        decoration: BoxDecoration(
          color: movieCardGrey,
          borderRadius: BorderRadius.circular(radiusXS),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: exactWidht * .3,
              child: CachedNetworkImage(
                imageUrl: itemPosterUrl(item.posterPath),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: radiusBoxDecoration.copyWith(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, imgUrl) => Container(
                  decoration: radiusBoxDecoration,
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: radiusBoxDecoration,
                  child: Center(
                    child: Icon(
                      Icons.error,
                      color: movieCardGrey,
                      size: exactWidht * .1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              width: exactWidht * .7,
              padding: EdgeInsets.all(size.width * .0125),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.originalLanguage == "en"
                        ? item.title
                        : item.originalTitle,
                    style: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: radiusBoxDecorationLG.copyWith(
                          color: const Color(0xFFedae02),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: spaceSM,
                          vertical: spaceXS,
                        ),
                        child: Text(
                          "IMDB " + item.voteAverage.toString(),
                          style: const TextStyle(
                            color: movieCardGreyDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    item.overview,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
