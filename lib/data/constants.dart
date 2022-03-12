import 'package:flutter/material.dart';

// API url prefixes

const imagePrefix = "https://image.tmdb.org/t/p";

// -------------------------------------------------
// Color and Gradient Data

const Color etiyaCorporateMain = Color(0xFF242441);
const Color etiyaCorporateSub = Color(0xFF424280);

const Color movieCardGrey = Color(0xFF9E9E9E);
const Color movieCardGreyDark = Color(0xFF757575);

const LinearGradient etiyaLinearGradient = LinearGradient(
  colors: [
    etiyaCorporateMain,
    etiyaCorporateSub,
    etiyaCorporateMain,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const BoxDecoration radiusBoxDecoration = BoxDecoration(
  color: etiyaCorporateMain,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(radiusXS)),
);

// -------------------------------------------------
// Custom Spacing Data for Margins and Paddings

const double spaceXS = 5.0;
const double spaceSM = 10.0;
const double spaceMD = 20.0;
const double spaceLG = 30.0;
const double spaceXL = 40.0;

// -------------------------------------------------
// Custom Radius Data for BoxDecorations

const double radiusXS = 5.0;
const double radiusSM = 10.0;
const double radiusMD = 20.0;
const double radiusLG = 30.0;
const double radiusXL = 40.0;

// -------------------------------------------------
// Custom InputDecoration Data for InputField

OutlineInputBorder customOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}

String itemPosterUrl(String posterPath) {
  return imagePrefix + '/w780' + posterPath;
}
