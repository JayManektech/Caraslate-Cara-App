/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/checked_icon.png
  AssetGenImage get checkedIcon =>
      const AssetGenImage('assets/images/checked_icon.png');

  /// File path: assets/images/cross_icon.png
  AssetGenImage get crossIcon =>
      const AssetGenImage('assets/images/cross_icon.png');

  /// File path: assets/images/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/images/home_icon.png');

  /// File path: assets/images/home_logo_image.png
  AssetGenImage get homeLogoImage =>
      const AssetGenImage('assets/images/home_logo_image.png');

  /// File path: assets/images/login_logo_image.png
  AssetGenImage get loginLogoImage =>
      const AssetGenImage('assets/images/login_logo_image.png');

  /// File path: assets/images/settings_icon.png
  AssetGenImage get settingsIcon =>
      const AssetGenImage('assets/images/settings_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        checkedIcon,
        crossIcon,
        homeIcon,
        homeLogoImage,
        loginLogoImage,
        settingsIcon
      ];
}

class $AssetsServerGen {
  const $AssetsServerGen();

  /// File path: assets/server/cleanslate.pem
  String get cleanslate => 'assets/server/cleanslate.pem';

  /// List of all assets
  List<String> get values => [cleanslate];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsServerGen server = $AssetsServerGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
