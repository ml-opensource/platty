import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platty/platty.dart';

class PTextField extends PlatformAdaptingWidget {
  final TextEditingController controller;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  final BoxDecoration iosDecoration;
  final InputDecoration decoration;

  final OverlayVisibilityMode iosPrefixMode;

  final OverlayVisibilityMode iosSuffixMode;

  final OverlayVisibilityMode iosClearButtonMode;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType iosKeyboardType;

  final TextInputAction textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  final TextStyle style;

  final StrutStyle strutStyle;

  final TextAlign textAlign;

  final ToolbarOptions toolbarOptions;

  /// {@macro flutter.material.inputDecorator.textAlignVertical}
  final TextAlignVertical textAlignVertical;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool showCursor;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  final int maxLength;

  final bool maxLengthEnforced;

  /// {@macro flutter.widgets.editableText.onChanged}
  final ValueChanged<String> onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback onEditingComplete;

  final ValueChanged<String> onSubmitted;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter> inputFormatters;

  final bool enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius cursorRadius;

  final Color cursorColor;

  final Brightness iosKeyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController scrollController;

  /// {@macro flutter.widgets.edtiableText.scrollPhysics}
  final ScrollPhysics scrollPhysics;

  /// {@macro flutter.rendering.editable.selectionEnabled}
  bool get selectionEnabled => enableInteractiveSelection;

  /// {@macro flutter.material.textfield.onTap}
  final GestureTapCallback onTap;

  PTextField({
    this.controller,
    this.focusNode,
    this.iosDecoration,
    this.decoration,
    this.iosPrefixMode,
    this.iosSuffixMode,
    this.iosClearButtonMode,
    this.iosKeyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.toolbarOptions,
    this.textAlignVertical,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.iosKeyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.dragStartBehavior,
    this.scrollController,
    this.scrollPhysics,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  // TODO: implement renderCupertino
  get renderCupertino => (BuildContext context) {
        /// patch same hint style as material, since cupertino does not
        /// directly support it.
        final hintStyle = decoration.hintStyle ??
            TextStyle(color: Theme.of(context)?.hintColor);
        return CupertinoTextField(
          controller: this.controller,
          focusNode: this.focusNode,
          decoration: this.iosDecoration,
          padding: decoration.contentPadding ?? const EdgeInsets.all(6.0),
          placeholder: decoration.hintText,
          placeholderStyle: hintStyle,
          prefix: decoration.prefix,
          prefixMode: this.iosPrefixMode ?? OverlayVisibilityMode.always,
          suffix: decoration.suffix,
          suffixMode: this.iosSuffixMode ?? OverlayVisibilityMode.always,
          clearButtonMode:
              this.iosClearButtonMode ?? OverlayVisibilityMode.never,
          keyboardType: this.iosKeyboardType,
          textInputAction: this.textInputAction,
          textCapitalization: this.textCapitalization,
          style: this.style,
          strutStyle: this.strutStyle,
          textAlign: this.textAlign,
          textAlignVertical: this.textAlignVertical,
          readOnly: this.readOnly,
          toolbarOptions: this.toolbarOptions,
          showCursor: this.showCursor,
          autofocus: this.autofocus,
          obscureText: this.obscureText,
          autocorrect: this.autocorrect,
          maxLines: this.maxLines,
          minLines: this.minLines,
          expands: this.expands,
          maxLength: this.maxLength,
          maxLengthEnforced: this.maxLengthEnforced,
          onChanged: this.onChanged,
          onEditingComplete: this.onEditingComplete,
          onSubmitted: this.onSubmitted,
          inputFormatters: this.inputFormatters,
          enabled: this.enabled,
          cursorWidth: this.cursorWidth,
          cursorRadius: this.cursorRadius,
          cursorColor: this.cursorColor,
          keyboardAppearance: this.iosKeyboardAppearance,
          scrollPadding: this.scrollPadding,
          dragStartBehavior: this.dragStartBehavior ?? DragStartBehavior.start,
          enableInteractiveSelection: this.enableInteractiveSelection,
          onTap: this.onTap,
          scrollController: this.scrollController,
          scrollPhysics: this.scrollPhysics,
        );
      };

  @override
  // TODO: implement renderMaterial
  get renderMaterial => (BuildContext context) {
        return TextField(
          controller: this.controller,
          focusNode: this.focusNode,
          decoration: this.decoration,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: this.style,
          strutStyle: this.strutStyle,
          textAlign: this.textAlign,
          textAlignVertical: this.textAlignVertical,
          readOnly: this.readOnly,
          toolbarOptions: this.toolbarOptions,
          showCursor: this.showCursor,
          autofocus: this.autofocus,
          obscureText: this.obscureText,
          autocorrect: this.autocorrect,
          maxLines: this.maxLines,
          minLines: this.minLines,
          expands: this.expands,
          maxLength: this.maxLength,
          maxLengthEnforced: this.maxLengthEnforced,
          onChanged: this.onChanged,
          onEditingComplete: this.onEditingComplete,
          onSubmitted: this.onSubmitted,
          inputFormatters: this.inputFormatters,
          enabled: this.enabled,
          cursorWidth: this.cursorWidth,
          cursorRadius: this.cursorRadius,
          cursorColor: this.cursorColor,
          scrollPadding: this.scrollPadding,
          enableInteractiveSelection: this.enableInteractiveSelection,
          onTap: this.onTap,
          scrollController: this.scrollController,
          scrollPhysics: this.scrollPhysics,
        );
      };
}
