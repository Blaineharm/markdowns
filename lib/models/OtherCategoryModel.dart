
import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/otherrangemodel.dart';


class OtherCategoryModel{


  String _categoryName = "";
  String _categoryNumber = "";
  int _rangeRollOtherCurrentRetek;
  int _rangeRollUpOtherFound = 0;
  int _rangeRollUpOtherinitialRetek = 0;
  List<MarkdownRangeModel> _ranges = new List();
  int _rangeRolledUpOtherSold = 0;
  int _rangeRolledOtherOutstanding = 0;
  List<OtherRangeModel> _otherRangeModel = new List();


  int get rangeRolledOtherOutstanding => _rangeRolledOtherOutstanding;

  set rangeRolledOtherOutstanding(int value) {
    _rangeRolledOtherOutstanding = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  String get categoryNumber => _categoryNumber;

  set categoryNumber(String value) {
    _categoryNumber = value;
  }

  int get rangeRollOtherCurrentRetek => _rangeRollOtherCurrentRetek;

  set rangeRollOtherCurrentRetek(int value) {
    _rangeRollOtherCurrentRetek = value;
  }

  int get rangeRolledUpOtherSold => _rangeRolledUpOtherSold;

  set rangeRolledUpOtherSold(int value) {
    _rangeRolledUpOtherSold = value;
  }

  List<MarkdownRangeModel> get ranges => _ranges;

  set ranges(List<MarkdownRangeModel> value) {
    _ranges = value;
  }

  int get rangeRollUpOtherinitialRetek => _rangeRollUpOtherinitialRetek;

  set rangeRollUpOtherinitialRetek(int value) {
    _rangeRollUpOtherinitialRetek = value;
  }

  int get rangeRollUpOtherFound => _rangeRollUpOtherFound;

  set rangeRollUpOtherFound(int value) {
    _rangeRollUpOtherFound = value;
  }

  List<OtherRangeModel> get otherRangeModel => _otherRangeModel;

  set otherRangeModel(List<OtherRangeModel> value) {
    _otherRangeModel = value;
  }


}