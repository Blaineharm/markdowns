
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';


class FirstMarkdownDepartmentModel {

  int _currentRollup1st = 0;
  int _initialRollup1st = 0;
  int _firstMarkdownFound = 0;
  int _outstanding1st = 0;
  String _departmentName = "";
  String _departmentNumber = "";
  int _Sold1st;
  List<FirstMarkdownCategoryModel> _firstMarkdownCategoryList = new List();

  int get currentRollup1st => _currentRollup1st;


  int get Sold1st => _Sold1st;

  set Sold1st(int value) {
    _Sold1st = value;
  }

  set currentRollup1st(int value) {
    _currentRollup1st = value;
  }

  List<FirstMarkdownCategoryModel> get firstMarkdownCategoryList =>
      _firstMarkdownCategoryList;

  set firstMarkdownCategoryList(List<FirstMarkdownCategoryModel> value) {
    _firstMarkdownCategoryList = value;
  }

  String get departmentNumber => _departmentNumber;

  set departmentNumber(String value) {
    _departmentNumber = value;
  }

  String get departmentName => _departmentName;

  set departmentName(String value) {
    _departmentName = value;
  }

  int get outstanding1st => _outstanding1st;

  set outstanding1st(int value) {
    _outstanding1st = value;
  }

  int get firstMarkdownFound => _firstMarkdownFound;

  set firstMarkdownFound(int value) {
    _firstMarkdownFound = value;
  }

  int get initialRollup1st => _initialRollup1st;

  set initialRollup1st(int value) {
    _initialRollup1st = value;
  }

}