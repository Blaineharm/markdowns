
class NSOHModel {

  List<NSOHModel> nsohList = new List();

  String _barcode = "";
  String _categoryDescription = "";
  String _categoryNumber = "";
  String _departmentDescription = "";
  int _departmentNumber = 0;
  bool _hasBeenCompleted;
  int _quantity = 0;
  String _rangeDescription = "";
  int _rangeNumber = 0;
  String _skuDescription = "";
  int _skuNumber = 0;
  String _styleDescription = "";
  int _styleNumber = 0;

  String get barcode => _barcode;

  set barcode(String value) {
    _barcode = value;
  }

  String get categoryDescription => _categoryDescription;

  int get styleNumber => _styleNumber;

  set styleNumber(int value) {
    _styleNumber = value;
  }

  String get styleDescription => _styleDescription;

  set styleDescription(String value) {
    _styleDescription = value;
  }

  int get skuNumber => _skuNumber;

  set skuNumber(int value) {
    _skuNumber = value;
  }

  String get skuDescription => _skuDescription;

  set skuDescription(String value) {
    _skuDescription = value;
  }

  int get rangeNumber => _rangeNumber;

  set rangeNumber(int value) {
    _rangeNumber = value;
  }

  String get rangeDescription => _rangeDescription;

  set rangeDescription(String value) {
    _rangeDescription = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  bool get hasBeenCompleted => _hasBeenCompleted;

  set hasBeenCompleted(bool value) {
    _hasBeenCompleted = value;
  }

  int get departmentNumber => _departmentNumber;

  set departmentNumber(int value) {
    _departmentNumber = value;
  }

  String get departmentDescription => _departmentDescription;

  set departmentDescription(String value) {
    _departmentDescription = value;
  }

  String get categoryNumber => _categoryNumber;

  set categoryNumber(String value) {
    _categoryNumber = value;
  }

  set categoryDescription(String value) {
    _categoryDescription = value;
  }


}