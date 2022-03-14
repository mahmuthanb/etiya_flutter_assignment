import 'package:cached_network_image/cached_network_image.dart';
import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:etiya_flutter_assignment/model/single_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Main Widget to show data in details page
class MovieDetailPageWidget extends StatelessWidget {
  const MovieDetailPageWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  final SingleMovieModel data;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: size.height * .25,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            background: CachedNetworkImage(
              imageUrl: itemPosterUrl(data.backdropPath!),
              placeholder: (context, imgUrl) => Container(
                decoration: radiusBoxDecoration,
              ),
              errorWidget: (context, url, error) => Container(
                decoration: radiusBoxDecoration,
                child: Center(
                  child: Icon(
                    Icons.error,
                    color: movieCardGrey,
                    size: size.width * .1,
                  ),
                ),
              ),
            ),
            collapseMode: CollapseMode.parallax,
            centerTitle: true,
            expandedTitleScale: 1,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: const EdgeInsets.all(spaceSM),
            child: Column(
              children: [
                Container(
                  child: data.originalLanguage != "en"
                      ? Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: spaceXS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title in Original Language (${data.originalLanguage})",
                                style: headerTextStyle,
                              ),
                              Text(
                                data.originalTitle,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: spaceXS),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InfoBox(
                          Column(
                            children: [
                              Icon(
                                Icons.family_restroom,
                                color: data.adult ? Colors.red : Colors.green,
                                size: 15,
                              ),
                              data.adult
                                  ? const Text("Adult Content")
                                  : const Text("Not restricted")
                            ],
                          ),
                          first: true,
                        ),
                        InfoBox(
                          Column(
                            children: [
                              const Text("Release Date"),
                              Text(
                                //"IMDB " +
                                DateFormat('dd.MM.yyyy')
                                    .format(data.releaseDate),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InfoBox(
                          Column(
                            children: [
                              const Text("IMDB"),
                              Text(
                                data.voteAverage.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InfoBox(
                          Column(
                            children: [
                              const Text("Revenue"),
                              Text(
                                NumberFormat.simpleCurrency()
                                    .format(data.revenue),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: spaceXS),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Overview", style: headerTextStyle),
                        Text(
                          data.overview!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )),
                data.productionCompanies.isNotEmpty
                    ? ProductionCompaniesList(data.productionCompanies)
                    : Container(),
                data.productionCountries.isNotEmpty
                    ? ProductionCountriesList(data.productionCountries)
                    : Container(),
                data.genres.isNotEmpty ? GenresList(data.genres) : Container(),
              ],
            ),
          )
        ]))
      ]),
    );
  }
}

class ProductionCountriesList extends StatelessWidget {
  const ProductionCountriesList(
    this.productionCountries, {
    Key? key,
  }) : super(key: key);

  final List<ProductionCountry> productionCountries;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Production Countries",
            style: headerTextStyle,
          ),
          padding: const EdgeInsets.symmetric(vertical: spaceXS),
        ),
        SizedBox(
          height: size.height * .05,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => Container(
                  margin: index == 0
                      ? const EdgeInsets.only(
                          right: spaceXS,
                          top: spaceXS,
                          bottom: spaceXS,
                        )
                      : const EdgeInsets.all(spaceXS),
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * .005,
                    horizontal: size.height * .0125,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radiusSM),
                    ),
                  ),
                  height: size.height * .05,
                  child: Text(
                    "${productionCountries[index].name} (${productionCountries[index].iso31661})",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            itemCount: productionCountries.length,
          ),
        ),
      ],
    );
  }
}

class GenresList extends StatelessWidget {
  const GenresList(
    this.genres, {
    Key? key,
  }) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Genres",
            style: headerTextStyle,
          ),
          padding: const EdgeInsets.symmetric(vertical: spaceXS),
        ),
        SizedBox(
          height: size.height * .05,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => Container(
                  margin: index == 0
                      ? const EdgeInsets.only(
                          right: spaceXS,
                          top: spaceXS,
                          bottom: spaceXS,
                        )
                      : const EdgeInsets.all(spaceXS),
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * .005,
                    horizontal: size.height * .0125,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radiusSM),
                    ),
                  ),
                  height: size.height * .05,
                  child: Text(
                    genres[index].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            itemCount: genres.length,
          ),
        ),
      ],
    );
  }
}

class ProductionCompaniesList extends StatelessWidget {
  const ProductionCompaniesList(
    this.companiesList, {
    Key? key,
  }) : super(key: key);

  final List<ProductionCompany> companiesList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Production Companies",
            style: headerTextStyle,
          ),
          padding: const EdgeInsets.symmetric(vertical: spaceXS),
        ),
        SizedBox(
          height: size.height * .15,
          width: size.width,
          // color: Colors.amberAccent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              ProductionCompany item = companiesList[index];
              return Container(
                margin: index == 0
                    ? const EdgeInsets.only(
                        right: spaceXS,
                        top: spaceXS,
                        bottom: spaceXS,
                      )
                    : const EdgeInsets.all(spaceXS),
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .005,
                  horizontal: size.height * .0125,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: item.logoPath != null ? Colors.white : Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(radiusSM),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * .05,
                      child: item.logoPath != null
                          ? CachedNetworkImage(
                              imageUrl: itemPosterUrl(item.logoPath!),
                              width: size.width * .2,
                              fit: BoxFit.fitWidth,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(radiusXS)),
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
                                    size: size.width * .1,
                                  ),
                                ),
                              ),
                            )
                          : Image.asset(
                              'assets/images/etiya_logo.png',
                              fit: BoxFit.fitWidth,
                              width: size.width * .25,
                            ),
                    ),
                    Container(
                      decoration: radiusBoxDecorationLG,
                      padding: const EdgeInsets.all(spaceXS),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.public,
                            size: 15,
                            color: Colors.white,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              item.originCountry,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .025,
                      child: Expanded(
                        child: Text(
                          item.name,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            itemCount: companiesList.length,
          ),
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox(
    this.widget, {
    Key? key,
    this.first = false,
  }) : super(key: key);

  final Widget widget;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: radiusBoxDecorationSM.copyWith(
        color: etiyaCorporateSub,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: spaceMD,
        vertical: spaceXS,
      ),
      margin: first
          ? const EdgeInsets.only(right: spaceXS)
          : const EdgeInsets.symmetric(horizontal: spaceXS),
      child: widget,
    );
  }
}
