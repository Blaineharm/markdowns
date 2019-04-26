
import 'package:markdowns/models/OtherCategoryModel.dart';

class OtherDepartmentModel {


  int _initialRollupOther = 0;
  int _currentRollupOther = 0;
  int _otherFound = 0;
  int _SoldOther = 0;
  int _outstandingOther = 0;
  String _departmentName = "";
  String _departmentNumber = "";
  List<OtherCategoryModel> _otherCategoryList = new List();

  set initialRollupOther(int value) {
    _initialRollupOther = value;
  }

  set currentRollupOther(int value) {
    _currentRollupOther = value;
  }

  set otherCategoryList(List<OtherCategoryModel> value) {
    _otherCategoryList = value;
  }

  set departmentNumber(String value) {
    _departmentNumber = value;
  }

  set departmentName(String value) {
    _departmentName = value;
  }

  set outstandingOther(int value) {
    _outstandingOther = value;
  }

  set SoldOther(int value) {
    _SoldOther = value;
  }

  set otherFound(int value) {
    _otherFound = value;
  }

  List<OtherCategoryModel> get otherCategoryList => _otherCategoryList;

  String get departmentNumber => _departmentNumber;

  String get departmentName => _departmentName;

  int get outstandingOther => _outstandingOther;

  int get SoldOther => _SoldOther;

  int get otherFound => _otherFound;

  int get currentRollupOther => _currentRollupOther;

  int get initialRollupOther => _initialRollupOther;


}
