import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/font.dart';
import 'package:flutter/material.dart';

class BaseOwnThemeFont implements OwnThemeFont {
  BaseOwnThemeFont();

  @override
  OwnThemeFontFamily family = BaseOwnThemeFontFamily();

  @override
  OwnThemeFontWeight weight = BaseOwnThemeFontWeight();

  @override
  OwnThemeFontSize size = BaseOwnThemeFontSize();
}

class BaseOwnThemeFontFamily implements OwnThemeFontFamily {
  BaseOwnThemeFontFamily({String? base}) {
    this.base = base ?? this.base;
  }

  @override
  String base = 'Montserrat';
}

class BaseOwnThemeFontWeight implements OwnThemeFontWeight {
  BaseOwnThemeFontWeight({
    FontWeight? light,
    FontWeight? regular,
    FontWeight? medium,
    FontWeight? semiBold,
    FontWeight? bold,
  }) {
    this.light = light ?? this.light;
    this.regular = regular ?? this.regular;
    this.medium = medium ?? this.medium;
    this.semiBold = semiBold ?? this.semiBold;
    this.bold = bold ?? this.bold;
  }

  @override
  FontWeight bold = FontWeight.w700;

  @override
  FontWeight light = FontWeight.w300;

  @override
  FontWeight medium = FontWeight.w500;

  @override
  FontWeight regular = FontWeight.w400;

  @override
  FontWeight semiBold = FontWeight.w600;
}

class BaseOwnThemeFontSize implements OwnThemeFontSize {
  BaseOwnThemeFontSize({
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
  }) {
    this.xxxs = xxxs ?? this.xxxs;
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
    this.xl = xl ?? this.xl;
    this.xxl = xxl ?? this.xxl;
    this.xxxl = xxxl ?? this.xxxl;
  }

  @override
  double lg = 40;

  @override
  double md = 32;

  @override
  double sm = 24;

  @override
  double xl = 48;

  @override
  double xs = 20;

  @override
  double xxl = 64;

  @override
  double xxxl = 64;

  @override
  double xxxs = 14;

  @override
  double xxs = 16;

  @override
  double ul = 80;

  @override
  double us = 12;
}
