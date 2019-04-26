import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/threecrangemodel.dart';

class ThreeCCategoryModel{

  String _categoryName = "";
  String _categoryNumber = "";
  int _rangeRollUp3cCurrentRetek = 0;
  int _rangeRollUp3cFound = 0;
  int _rangeRollUp3cinitialRetek = 0;
  List<MarkdownRangeModel> _ranges = new List();
  int _rangeRolledUpc3Sold = 0;
  int _rangeRolledUp3cOutstanding = 0;
  List<ThreeCRangeModel> _threeCRangeList = new List();

  List<MarkdownRangeModel> get ranges => _ranges;

  int get rangeRolledUp3cOutstanding => _rangeRolledUp3cOutstanding;

  set rangeRolledUp3cOutstanding(int value) {
    _rangeRolledUp3cOutstanding = value;
  }

  int get rangeRolledUpc3Sold => _rangeRolledUpc3Sold;

  set rangeRolledUpc3Sold(int value) {
    _rangeRolledUpc3Sold = value;
  }

  int get rangeRollUp3cinitialRetek => _rangeRollUp3cinitialRetek;

  set rangeRollUp3cinitialRetek(int value) {
    _rangeRollUp3cinitialRetek = value;
  }

  int get rangeRollUp3cFound => _rangeRollUp3cFound;

  set rangeRollUp3cFound(int value) {
    _rangeRollUp3cFound = value;
  }

  int get rangeRollUp3cCurrentRetek => _rangeRollUp3cCurrentRetek;

  set rangeRollUp3cCurrentRetek(int value) {
    _rangeRollUp3cCurrentRetek = value;
  }

  String get categoryNumber => _categoryNumber;

  set categoryNumber(String value) {
    _categoryNumber = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  List<ThreeCRangeModel> get threeCRangeList => _threeCRangeList;

  set threeCRangeList(List<ThreeCRangeModel> value) {
    _threeCRangeList = value;
  }


}