import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:flutter/material.dart';

class DetailsPagePlaceholderWidget extends StatelessWidget {
  const DetailsPagePlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * .25,
            color: etiyaCorporateSub,
          ),
          Container(
            height: size.width * .15,
            padding: const EdgeInsets.symmetric(
              vertical: spaceSM,
            ),
            child: ListView.builder(
              itemBuilder: ((context, index) => Container(
                    width: size.width * .3,
                    height: size.width * .15,
                    margin: index == 0
                        ? const EdgeInsets.symmetric(horizontal: spaceSM)
                        : const EdgeInsets.only(right: spaceSM),
                    decoration: radiusBoxDecoration.copyWith(
                      color: etiyaCorporateSub,
                    ),
                  )),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(spaceSM),
            height: size.height * .025,
            width: size.width * .5,
            decoration: radiusBoxDecoration.copyWith(
              color: etiyaCorporateSub,
            ),
          ),
          Container(
            height: size.height * .25,
            margin: const EdgeInsets.all(spaceSM),
            decoration: radiusBoxDecoration.copyWith(color: etiyaCorporateSub),
          ),
          Container(
            margin: const EdgeInsets.all(spaceSM),
            height: size.height * .025,
            width: size.width * .35,
            decoration: radiusBoxDecoration.copyWith(
              color: etiyaCorporateSub,
            ),
          ),
          Container(
            height: size.width * .15,
            padding: const EdgeInsets.symmetric(
              vertical: spaceXS,
            ),
            child: ListView.builder(
              itemBuilder: ((context, index) => Container(
                    width: size.width * .2,
                    height: size.width * .2,
                    margin: index == 0
                        ? const EdgeInsets.symmetric(horizontal: spaceSM)
                        : const EdgeInsets.only(right: spaceSM),
                    decoration: radiusBoxDecoration.copyWith(
                      color: etiyaCorporateSub,
                    ),
                  )),
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(spaceSM),
            height: size.height * .025,
            width: size.width * .35,
            decoration: radiusBoxDecoration.copyWith(
              color: etiyaCorporateSub,
            ),
          ),
          Container(
            height: size.width * .1,
            padding: const EdgeInsets.symmetric(
              vertical: spaceSM,
            ),
            child: ListView.builder(
              itemBuilder: ((context, index) => Container(
                    width: size.width * .2,
                    height: size.width * .2,
                    margin: index == 0
                        ? const EdgeInsets.symmetric(horizontal: spaceSM)
                        : const EdgeInsets.only(right: spaceSM),
                    decoration: radiusBoxDecoration.copyWith(
                      color: etiyaCorporateSub,
                    ),
                  )),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(spaceSM),
            height: size.height * .025,
            width: size.width * .35,
            decoration: radiusBoxDecoration.copyWith(
              color: etiyaCorporateSub,
            ),
          ),
          Container(
            height: size.width * .1,
            padding: const EdgeInsets.symmetric(
              vertical: spaceSM,
            ),
            child: ListView.builder(
              itemBuilder: ((context, index) => Container(
                    width: size.width * .2,
                    height: size.width * .2,
                    margin: index == 0
                        ? const EdgeInsets.symmetric(horizontal: spaceSM)
                        : const EdgeInsets.only(right: spaceSM),
                    decoration: radiusBoxDecoration.copyWith(
                      color: etiyaCorporateSub,
                    ),
                  )),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
