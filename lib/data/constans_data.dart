import 'package:flutter/material.dart';

// Color and Gradient Data

const Color etiyaCorporateMain = Color(0xFF242441);
const Color etiyaCorporateSub = Color(0xFF424280);

const etiyaLinearGradient = LinearGradient(
  colors: [
    etiyaCorporateMain,
    etiyaCorporateSub,
    etiyaCorporateMain,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// -------------------------------------------------
// Custom Spacing Data for Margins and Paddings

const double spaceXS = 5.0;
const double spaceSM = 15.0;
const double spaceMD = 25.0;
const double spaceLG = 35.0;
const double spaceXL = 45.0;

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
