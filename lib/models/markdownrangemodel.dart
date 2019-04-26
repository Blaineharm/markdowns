
import 'package:markdowns/models/markdownstylemodel.dart';
import 'package:markdowns/models/departmentModel.dart';

class MarkdownRangeModel extends DepartmentModel{
  String rangeName = "";
  String rangeNumber = "";
  int _styleRollUp1StCurrentRetek = 0;
  int _styleRollUp1StFound = 0;
  int _styleRollUp1StInitialRetek = 0;
  int _styleRollUp3CCurrentRetek = 0;
  int _styleRollUp3CFound = 0;
  int _styleRollUp3CInitialRetek = 0;
  int _styleRollUpOtherCurrentRetek = 0;
  int _styleRollUpOtherFound = 0;
  int _styleRollUpOtherInitialRetek = 0;
  List<MarkdownStyleModel> styles = new List();
  int _styleRolledUp1stSold = 0;
  int _styleRolledUp3CSold = 0;
  int _styleRolledUpOtherSold = 0;
  int _styleRolledUp1stOutstanding = 0;
  int _styleRolledUp3cOutstanding = 0;
  int _styleRolledUpOtherOutstanding = 0;


  int get styleRolledUp1stOutstanding => _styleRolledUp1stOutstanding;

  set styleRolledUp1stOutstanding(int value) {
    _styleRolledUp1stOutstanding = value;
  }

  int get styleRollUp1StFound => _styleRollUp1StFound;

  set styleRollUp1StFound(int value) {
    _styleRollUp1StFound = value;
  }

  int get styleRollUp1StInitialRetek => _styleRollUp1StInitialRetek;

  set styleRollUp1StInitialRetek(int value) {
    _styleRollUp1StInitialRetek = value;
  }

  int get styleRollUp3CCurrentRetek => _styleRollUp3CCurrentRetek;

  set styleRollUp3CCurrentRetek(int value) {
    _styleRollUp3CCurrentRetek = value;
  }

  int get styleRollUp3CFound => _styleRollUp3CFound;

  set styleRollUp3CFound(int value) {
    _styleRollUp3CFound = value;
  }

  int get styleRollUp3CInitialRetek => _styleRollUp3CInitialRetek;

  set styleRollUp3CInitialRetek(int value) {
    _styleRollUp3CInitialRetek = value;
  }

  int get styleRollUpOtherCurrentRetek => _styleRollUpOtherCurrentRetek;

  set styleRollUpOtherCurrentRetek(int value) {
    _styleRollUpOtherCurrentRetek = value;
  }

  int get styleRollUpOtherFound => _styleRollUpOtherFound;

  set styleRollUpOtherFound(int value) {
    _styleRollUpOtherFound = value;
  }

  int get styleRollUpOtherInitialRetek => _styleRollUpOtherInitialRetek;

  set styleRollUpOtherInitialRetek(int value) {
    _styleRollUpOtherInitialRetek = value;
  }

  int get styleRollUp1StCurrentRetek => _styleRollUp1StCurrentRetek;

  set styleRollUp1StCurrentRetek(int value) {
    _styleRollUp1StCurrentRetek = value;
  }

  int get styleRolledUpOtherSold => _styleRolledUpOtherSold;

  set styleRolledUpOtherSold(int value) {
    _styleRolledUpOtherSold = value;
  }

  int get styleRolledUp3CSold => _styleRolledUp3CSold;

  set styleRolledUp3CSold(int value) {
    _styleRolledUp3CSold = value;
  }

  int get styleRolledUp1stSold => _styleRolledUp1stSold;

  set styleRolledUp1stSold(int value) {
    _styleRolledUp1stSold = value;
  }

  int get styleRolledUp3cOutstanding => _styleRolledUp3cOutstanding;

  set styleRolledUp3cOutstanding(int value) {
    _styleRolledUp3cOutstanding = value;
  }

  int get styleRolledUpOtherOutstanding => _styleRolledUpOtherOutstanding;

  set styleRolledUpOtherOutstanding(int value) {
    _styleRolledUpOtherOutstanding = value;
  }


}