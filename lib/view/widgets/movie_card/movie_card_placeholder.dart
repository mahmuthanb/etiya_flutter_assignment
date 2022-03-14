import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.only(bottom: size.width * .025),
      padding: EdgeInsets.all(size.width * .025),
      height: size.height * .2,
      width: exactWidth,
      decoration: BoxDecoration(
        color: movieCardGrey,
        borderRadius: BorderRadius.circular(radiusXS),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Left Image Box with ETIYA Logo
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
          // Right section of placeholder item
          SizedBox(
            width: exactWidth * .675,
            // color: Colors.amber,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * .02,
                  width: size.width * .45,
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
                      height: size.height * .025,
                      margin: EdgeInsets.only(bottom: size.width * .0125),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: size.width * .00625),
                              decoration: radiusBoxDecoration.copyWith(
                                  color: movieCardGreyDark),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: size.width * .00625),
                              decoration: radiusBoxDecoration.copyWith(
                                  color: movieCardGreyDark),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .04,
                      decoration: radiusBoxDecoration.copyWith(
                          color: movieCardGreyDark),
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

class MovieCardLoadingWidget extends StatelessWidget {
  const MovieCardLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: movieCardGreyDark,
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(
          left: size.width * .025,
          right: size.width * .025,
          top: size.width * .025,
        ),
        child: ListView.builder(
          itemBuilder: ((context, index) => MovieCardPlaceholder(index)),
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
