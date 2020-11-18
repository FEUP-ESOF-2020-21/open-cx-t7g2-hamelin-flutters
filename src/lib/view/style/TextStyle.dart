import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const EvenLargerTextSize = 28.0;
const LargerTextSize = 22.0;
const LargeTextSize = 18.0;
const MediumLargeTextSize = 16.0;
const MediumTextSize = 14.0;
const BodyTextSize1 = 12.0;
const BodyTextSize2 = 13.0;

var titleTextStyle = GoogleFonts.lora(
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: MediumLargeTextSize,
    color: Colors.black,
  ),
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

var bodyTextStyle1 = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: BodyTextSize1,
    color: Colors.black,
  ),
);

var bodyTextStyle2 = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: BodyTextSize2,
    color: Colors.black,
  ),
);

var talkSpeakerTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: BodyTextSize2,
    color: Colors.white,
  ),
);
