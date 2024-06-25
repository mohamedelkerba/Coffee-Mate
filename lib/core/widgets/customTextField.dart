import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/core/colors.dart';
import 'package:myproject/core/widgets/defaultText.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      { this.label='',
        this.controller,
        Key? key,
        this.validator,
        this.keyboardType,
        this.onChange,
        required this.hint,
        this.isEnabled,
        this.prefix,
        this.suffix,
        this.onTap,
        this.readOnly = false,
        this.onFieldSubmitted,
        this.width = 394,
        this.focusNode,
        required this.autoFocus,
        this.contentPaddingHorizontal = 24,
        this.contentPaddingVertical = 12,
        this.radius = 25,
        this.height  ,
        this.fillColor = Colors.white,
        this.enabledBorderColor = brushBorder,
        this.focusBorderColor = selectedBorder,
        this.errorBorderColor = Colors.red,
        this.minLines =1,
        this.isDense,this.maxLines,
        this.isBorder = true,
        this.isCollapsed,
        this.hoverColor = Colors.transparent,
        this.hintFontSize = 16,
        this.sameBorderColor = false,
        this.inputFormatters,
         this.obsecureText= false ,

      })
      : super(key: key);
  String ?label;
  String hint;
  TextEditingController ?controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  Function(String)? onChange;
  Widget? prefix;
  Widget? suffix;
  bool? isEnabled;
  List<TextInputFormatter>? inputFormatters;
  double width;
  double? height;
  dynamic onTap;
  bool readOnly = false;
  Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  bool? autoFocus = false;
  double contentPaddingHorizontal;
  double contentPaddingVertical;
  double radius;
  Color? fillColor;
  Color enabledBorderColor;
  Color focusBorderColor;
  Color errorBorderColor;
  Color hoverColor;
  int minLines;
  bool? isDense;
  int? maxLines;
  final bool isBorder;
  bool? isCollapsed;
  int hintFontSize;
  bool sameBorderColor;
  bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      autofocus: autoFocus!,
      focusNode: focusNode,
      onChanged: onChange,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      enabled: isEnabled,
      inputFormatters: inputFormatters,
      obscureText: obsecureText,

      style: const TextStyle(color: Colors.black, fontSize:16,),
      readOnly: readOnly,
      decoration: InputDecoration(
          fillColor: fillColor,
          isCollapsed: isCollapsed ??false,
          hoverColor: hoverColor,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.symmetric(horizontal: contentPaddingHorizontal, vertical: contentPaddingVertical),
          helperStyle: const TextStyle(height: .2,),
          //helperText: "",
          prefixIcon: prefix,
          suffixIcon: suffix,
          isDense: isDense,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: DefaultText(
              text: label!,
              fontColor: textFieldColor,
              fontSize:  14,
            ),
          ),
          border: const OutlineInputBorder(),
          enabledBorder: isBorder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: sameBorderColor ?loginRequiredText.withOpacity(.03) : Colors.grey ,
              )
          ) : InputBorder.none,
          focusedBorder: isBorder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: sameBorderColor ?loginRequiredText.withOpacity(.03) : focusColor)
          ) : InputBorder.none,
          disabledBorder: isBorder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: enabledBorderColor)
          ) : InputBorder.none,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: errorBorderColor)
          ) ,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: errorBorderColor)
          )
      ),
    );
  }
}
