
import 'package:markdowns/models/threeccategorymodel.dart';


class ThreeCDepartmentModel {


  int _initialRollup3c = 0;
  int _currentRollup3c = 0;
  int _threeCFound = 0;
  int _Sold3c = 0;
  int _outstanding3c = 0;
  String _departmentName = "";
  String _departmentNumber = "";

  List<ThreeCCategoryModel> _threeCCategoryList = new List();

  int get initialRollup3c => _initialRollup3c;

  int get currentRollup3c => _currentRollup3c;

  int get threeCFound => _threeCFound;

  int get Sold3c => _Sold3c;

  int get outstanding3c => _outstanding3c;

  String get departmentName => _departmentName;

  String get departmentNumber => _departmentNumber;

  List<ThreeCCategoryModel> get threeCCategoryList => _threeCCategoryList;

  set threeCCategoryList(List<ThreeCCategoryModel> value) {
    _threeCCategoryList = value;
  }

  set departmentNumber(String value) {
    _departmentNumber = value;
  }

  set departmentName(String value) {
    _departmentName = value;
  }

  set outstanding3c(int value) {
    _outstanding3c = value;
  }

  set Sold3c(int value) {
    _Sold3c = value;
  }

  set threeCFound(int value) {
    _threeCFound = value;
  }

  set currentRollup3c(int value) {
    _currentRollup3c = value;
  }

  set initialRollup3c(int value) {
    _initialRollup3c = value;
  }


}