import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  double? fontSize;
  double? wordSpacing;
  double? height;
  FontWeight? fontWeight;
  Color? fontColor;
  String? fontFamily;
  String? text;
  TextAlign align;
  bool? isMultiLine;
  bool? isInSearch;
  InlineSpan? textSpan;
  TextDecoration? textDecoration;
  Color? decorationColor;
  TextOverflow overFlow;
  int? maxLines;
  DefaultText(
      {this.text,
        this.fontSize,
        this.fontColor,
        this.fontWeight,
        this.fontFamily,
        this.align = TextAlign.start,
        this.wordSpacing,
        this.height,
        this.isMultiLine = false,
        this.isInSearch = false,
        this.textSpan,
        this.textDecoration,
        this.decorationColor,
        this.overFlow = TextOverflow.clip,
        this.maxLines});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: align,
        maxLines: maxLines,
        overflow: overFlow,
        text:TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize:  fontSize,
              color: fontColor,
              wordSpacing: wordSpacing,
              height: height,
              decoration : textDecoration,
              decorationColor: decorationColor,
            )
        )
    );
  }
}
