import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../data/constans_data.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(this.iconData, this.message, {Key? key}) : super(key: key);
  final String message;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: etiyaLinearGradient,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: message == "disconnected" ? Colors.red : Colors.white,
              size: 50,
            ),
            Container(
              margin: const EdgeInsets.only(top: spaceMD),
              padding: const EdgeInsets.all(spaceSM),
              height: size.height * .2,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyText1!,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      message,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
