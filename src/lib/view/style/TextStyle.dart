import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const EvenLargerTextSize = 28.0;
const LargerTextSize = 22.0;
const LargeTextSize = 18.0;
const MediumTextSize = 14.0;
const BodyTextSize = 12.0;

const TitleTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: LargeTextSize,
  color: Colors.black,
);

var pageTitleTextStyle = GoogleFonts.lora(
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: EvenLargerTextSize,
    color: Colors.black,
  ),
);

var forumTitleStyle = GoogleFonts.lora(
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: LargerTextSize,
    color: Colors.white,
  ),
);

var forumTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: MediumTextSize,
    color: Colors.white,
  ),
);

const BodyTextStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.black,
);
