import 'package:flutter/material.dart';
import 'package:photo/src/delegate/badge_delegate.dart';
import 'package:photo/src/delegate/checkbox_builder_delegate.dart';
import 'package:photo/src/delegate/loading_delegate.dart';
import 'package:photo/src/delegate/sort_delegate.dart';

class Options {
  final int rowCount;

  final int maxSelected;

  final double padding;

  final double itemRadio;

  final Color titleColor;

  final Color bottomColor;

  final Color dividerColor;

  final Color textColor;

  final Color disableColor;

  final int thumbSize;

  final SortDelegate sortDelegate;

  final CheckBoxBuilderDelegate checkBoxBuilderDelegate;

  final LoadingDelegate loadingDelegate;

  final BadgeDelegate badgeDelegate;

  final PickType pickType;

  const Options({
    this.rowCount,
    this.maxSelected,
    this.padding,
    this.itemRadio,
    this.titleColor,
    this.bottomColor,
    this.dividerColor,
    this.textColor,
    this.disableColor,
    this.thumbSize,
    this.sortDelegate,
    this.checkBoxBuilderDelegate,
    this.loadingDelegate,
    this.badgeDelegate,
    this.pickType,
  });
}

enum PickType {
  all,
  onlyImage,
  onlyVideo,
}
