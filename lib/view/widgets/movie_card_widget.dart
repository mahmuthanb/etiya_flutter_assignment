import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../model/movie_model.dart';

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

    return Container(
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
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
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
    );
  }
}

class MovieCardPlaceholder extends StatelessWidget {
  const MovieCardPlaceholder(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double exactWidth = size.width * .9;

    return Container(
      margin: index == 0
          ? EdgeInsets.all(size.width * .025)
          : EdgeInsets.only(
              left: size.width * .025,
              right: size.width * .025,
              bottom: size.width * .025,
            ),
      padding: EdgeInsets.all(size.width * .025),
      height: size.height * .2,
      width: exactWidth,
      decoration: BoxDecoration(
        color: movieCardGrey,
        borderRadius: BorderRadius.circular(radiusXS),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: etiyaCorporateMain,
              borderRadius: BorderRadius.circular(radiusXS),
            ),
            padding: const EdgeInsets.all(spaceSM),
            // color: Colors.black,
            width: exactWidth * .3,
            height: exactWidth * .45,
            child: Image.asset(
              "assets/images/etiya_logo.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: exactWidth * .7,
            padding: EdgeInsets.symmetric(horizontal: size.width * .0125),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * .02,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radiusXS),
                    ),
                    color: movieCardGreyDark,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: size.height * .035,
                      margin: EdgeInsets.only(bottom: size.width * .0125),
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: size.width * .00625),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(radiusXS),
                                ),
                                // color: Colors.red,
                                color: movieCardGreyDark,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: size.width * .00625),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(radiusXS),
                                ),
                                // color: Colors.red,
                                color: movieCardGreyDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .04,
                      child: Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(radiusXS),
                            ),
                            color: movieCardGreyDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
