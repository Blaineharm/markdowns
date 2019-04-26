import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/firstmarkuprangemodel.dart';

class FirstMarkdownCategoryModel{

  String _categoryName;
  String _categoryNumber;
  int _rangeRollUp1stCurrentRetek;
  int _rangeRollUp1stFound;
  int _rangeRollUp1stinitialRetek;
  List<MarkdownRangeModel> _ranges = new List();
  int _rangeRolledUp1stSold;
  int _rangeRollUp1stOutstanding;
  List<FirstMarkupRangeModel> _firstMarkupRangeModel = new List();


  FirstMarkdownCategoryModel(this._categoryName, this._categoryNumber,
      this._rangeRollUp1stCurrentRetek, this._rangeRollUp1stFound,
      this._rangeRollUp1stinitialRetek);


  int get rangeRollUp1stOutstanding => _rangeRollUp1stOutstanding;

  set rangeRollUp1stOutstanding(int value) {
    _rangeRollUp1stOutstanding = value;
  }

  int get rangeRolledUp1stSold => _rangeRolledUp1stSold;

  set rangeRolledUp1stSold(int value) {
    _rangeRolledUp1stSold = value;
  }

  int get rangeRollUp1stFound => _rangeRollUp1stFound;

  set rangeRollUp1stFound(int value) {
    _rangeRollUp1stFound = value;
  }

  int get rangeRollUp1stCurrentRetek => _rangeRollUp1stCurrentRetek;

  set rangeRollUp1stCurrentRetek(int value) {
    _rangeRollUp1stCurrentRetek = value;
  }

  String get categoryNumber => _categoryNumber;

  set categoryNumber(String value) {
    _categoryNumber = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  List<MarkdownRangeModel> get ranges => _ranges;

  set ranges(List<MarkdownRangeModel> value) {
    _ranges = value;
  }

  int get rangeRollUp1stinitialRetek => _rangeRollUp1stinitialRetek;

  set rangeRollUp1stinitialRetek(int value) {
    _rangeRollUp1stinitialRetek = value;
  }

  List<FirstMarkupRangeModel> get firstMarkupRangeModel =>
      _firstMarkupRangeModel;

  set firstMarkupRangeModel(List<FirstMarkupRangeModel> value) {
    _firstMarkupRangeModel = value;
  }


}