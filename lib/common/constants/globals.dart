class Globals {
  static final _instance = Globals._internal();

  factory Globals() {
    return _instance;
  }

  Globals._internal();

  static const kDefaultFractionDigits = 2;
}
