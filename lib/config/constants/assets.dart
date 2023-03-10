abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();
  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get bell => '$basePath/bell.svg';
  String get profile => '$basePath/profile.svg';
  String get qr => '$basePath/qr.svg';
  String get settings => '$basePath/settings.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');
}
