import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/common/constants/globals.dart';
import '/common/functions/replace_with_english_numbers.dart';
import '/common/themes/colours.dart';

class NumberField extends StatefulWidget {
  const NumberField({
    super.key,
    this.controller,
    this.textStyle,
    this.initialValue,
    this.allowDecimalNumbers = false,
    this.allowStartingWithZero = true,
    this.fractionDigits = Globals.kDefaultFractionDigits,
    this.isReadOnly = false,
    this.maxLength,
    this.requestFocus = false,
    //this.onChanged,
    this.onSubmit,
    this.validateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.prefixIcon,
    this.labelText,
    this.isMandatory = false,
    this.hintText,
    this.suffixText,
    this.suffix,
    this.suffixIcon,
    this.errorText,
    this.boxConstraints,
  }) : assert(controller == null || initialValue == null);

  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? initialValue;
  final bool allowDecimalNumbers;
  final bool allowStartingWithZero;
  final int fractionDigits;
  final bool isReadOnly;
  final int? maxLength;
  final bool requestFocus;
  //final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final AutovalidateMode validateMode;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? fillColor;
  final Widget? prefixIcon;
  final String? labelText;
  final bool isMandatory;
  final String? hintText;
  final String? suffixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? errorText;
  final BoxConstraints? boxConstraints;

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (widget.controller != null && widget.onSubmit != null) {
          widget.onSubmit!(widget.controller!.text);
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.requestFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    });
  }

  String getDecimalNumberRegularExpression() {
    final fractionalPart = List.filled(widget.fractionDigits, '\\d?').join();
    return '^\\d+\\.?$fractionalPart';
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      style:
          widget.textStyle ??
          Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colours.kHighlightColor1),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      initialValue: widget.initialValue,
      keyboardType: widget.allowDecimalNumbers
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.number,
      inputFormatters: [
        widget.allowDecimalNumbers
            ? FilteringTextInputFormatter.allow(
                RegExp(getDecimalNumberRegularExpression()),
              )
            : FilteringTextInputFormatter.digitsOnly,
        if (!widget.allowStartingWithZero)
          FilteringTextInputFormatter.deny(RegExp(r'^0')),
      ],
      readOnly: widget.isReadOnly,
      maxLength: widget.maxLength,
      cursorColor: Colours.kHighlightColor5,
      onFieldSubmitted: (value) => widget.onSubmit != null
          ? widget.onSubmit!(replaceWithEnglishNumbers(value))
          : null,
      autovalidateMode: widget.validateMode,
      validator: (value) =>
          widget.validator != null ? widget.validator!(value) : null,
      onSaved: (value) => widget.onSaved != null
          ? widget.onSaved!(replaceWithEnglishNumbers(value ?? ''))
          : null,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        prefixIcon: widget.prefixIcon,
        label: widget.labelText != null
            ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.labelText,
                      style:
                          widget.textStyle ??
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colours.kHighlightColor1,
                          ),
                    ),
                    if (widget.isMandatory)
                      TextSpan(
                        text: '*',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colours.kErrorColor,
                        ),
                      ),
                  ],
                ),
              )
            : null,
        hintText: widget.hintText,
        suffixText: widget.suffixText,
        suffix: widget.suffix,
        suffixIcon: widget.suffixIcon,
        errorText: widget.errorText,
        errorMaxLines: 4,
        constraints: widget.boxConstraints,
      ),
    );
  }
}
