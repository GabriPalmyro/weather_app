import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/spacing.dart';
import 'package:flutter/material.dart';

class BaseOwnThemeSpacing implements OwnThemeSpacing {
  BaseOwnThemeSpacing({
    OwnThemeSpacingInline? inline,
    OwnThemeSpacingInset? inset,
    OwnThemeSpacingSquish? squish,
    OwnThemeSpacingStack? stack,
  }) {
    this.inline = inline ?? this.inline;
    this.inset = inset ?? this.inset;
    this.squish = squish ?? this.squish;
    this.stack = stack ?? this.stack;
  }

  @override
  OwnThemeSpacingInline inline = BaseOwnThemeSpacingInline();

  @override
  OwnThemeSpacingInset inset = BaseOwnThemeSpacingInset();

  @override
  OwnThemeSpacingSquish squish = BaseOwnThemeSpacingSquish();

  @override
  OwnThemeSpacingStack stack = BaseOwnThemeSpacingStack();
}

class BaseOwnThemeSpacingInline implements OwnThemeSpacingInline {
  BaseOwnThemeSpacingInline({
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
  double xxxs = 4;

  @override
  double xxs = 8;

  @override
  double xs = 16;

  @override
  double sm = 24;

  @override
  double md = 32;

  @override
  double lg = 40;

  @override
  double xl = 48;

  @override
  double xxl = 56;

  @override
  double xxxl = 64;
}

class BaseOwnThemeSpacingInset implements OwnThemeSpacingInset {
  BaseOwnThemeSpacingInset({
    EdgeInsets? xxxs,
    EdgeInsets? xxs,
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
  }) {
    this.xxs = xxs ?? this.xxs;
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
    this.xl = xl ?? this.xl;
  }

  @override
  EdgeInsets xxs = EdgeInsets.all(4);

  @override
  EdgeInsets xs = EdgeInsets.all(8);

  @override
  EdgeInsets sm = EdgeInsets.all(16);

  @override
  EdgeInsets md = EdgeInsets.all(24);

  @override
  EdgeInsets lg = EdgeInsets.all(32);

  @override
  EdgeInsets xl = EdgeInsets.all(48);
}

class BaseOwnThemeSpacingSquish implements OwnThemeSpacingSquish {

  BaseOwnThemeSpacingSquish({
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
  }) {
    this.xs = xs ?? this.xs;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  EdgeInsets lg = const EdgeInsets.symmetric(horizontal: 8, vertical: 16);

  @override
  EdgeInsets md = const EdgeInsets.symmetric(horizontal: 16, vertical: 24);

  @override
  EdgeInsets sm = const EdgeInsets.symmetric(horizontal: 16, vertical: 32);

  @override
  EdgeInsets xs = const EdgeInsets.symmetric(horizontal: 24, vertical: 40);
}

class BaseOwnThemeSpacingStack implements OwnThemeSpacingStack {
  BaseOwnThemeSpacingStack({
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
  double xxxs = 4;

  @override
  double xxs = 8;

  @override
  double xs = 16;

  @override
  double sm = 24;

  @override
  double md = 32;

  @override
  double lg = 40;

  @override
  double xl = 48;

  @override
  double xxl = 56;

  @override
  double xxxl = 64;
}
