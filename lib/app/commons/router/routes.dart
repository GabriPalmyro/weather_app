enum Routes {
  splash('/'),
  home('/home');

  const Routes(this.path);

  final String path;

  @override
  String toString() => name;
}
