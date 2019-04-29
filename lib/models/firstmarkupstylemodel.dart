
class FirstMarkupStyleModel {

  double _currentPrice = 0.0;
  int _currentRetekAmount = 0;
  int _foundAmount = 0;
  double _initialPrice = 0.0;
  int _initialRetekAmount = 0;
  bool _is3C;
  int _markdownNumber = 0;
  int _soldAmount = 0;
  String _styleDescription = "";
  String _styleNumber = "";
  int _outstanding = 0;


  int get outstanding => _outstanding;

  set outstanding(int value) {
    _outstanding = value;
  }

  double get currentPrice => _currentPrice;

  set currentPrice(double value) {
    _currentPrice = value;
  }

  int get currentRetekAmount => _currentRetekAmount;

  String get styleNumber => _styleNumber;

  set styleNumber(String value) {
    _styleNumber = value;
  }

  String get styleDescription => _styleDescription;

  set styleDescription(String value) {
    _styleDescription = value;
  }

  int get soldAmount => _soldAmount;

  set soldAmount(int value) {
    _soldAmount = value;
  }

  int get markdownNumber => _markdownNumber;

  set markdownNumber(int value) {
    _markdownNumber = value;
  }

  bool get is3C => _is3C;

  set is3C(bool value) {
    _is3C = value;
  }

  int get initialRetekAmount => _initialRetekAmount;

  set initialRetekAmount(int value) {
    _initialRetekAmount = value;
  }

  double get initialPrice => _initialPrice;

  set initialPrice(double value) {
    _initialPrice = value;
  }

  int get foundAmount => _foundAmount;

  set foundAmount(int value) {
    _foundAmount = value;
  }

  set currentRetekAmount(int value) {
    _currentRetekAmount = value;
  }


}