
import 'package:markdowns/models/firstmarkupstylemodel.dart';

class FirstMarkupRangeModel {


  String rangeName = "";
  String rangeNumber = "";
  int _styleRollUp1StCurrentRetek = 0;
  int _styleRollUp1StFound = 0;
  int _styleRollUp1StInitialRetek = 0;
  int _styleRolledUp1stSold = 0;
  int _styleRolledUp1stOutstanding = 0;
  List<FirstMarkupStyleModel> _firstMarkupStyleList = new List();

  int get styleRollUp1StCurrentRetek => _styleRollUp1StCurrentRetek;

  set styleRollUp1StCurrentRetek(int value) {
    _styleRollUp1StCurrentRetek = value;
  }

  int get styleRollUp1StFound => _styleRollUp1StFound;

  int get styleRolledUp1stOutstanding => _styleRolledUp1stOutstanding;

  set styleRolledUp1stOutstanding(int value) {
    _styleRolledUp1stOutstanding = value;
  }

  int get styleRolledUp1stSold => _styleRolledUp1stSold;

  set styleRolledUp1stSold(int value) {
    _styleRolledUp1stSold = value;
  }

  int get styleRollUp1StInitialRetek => _styleRollUp1StInitialRetek;

  set styleRollUp1StInitialRetek(int value) {
    _styleRollUp1StInitialRetek = value;
  }

  set styleRollUp1StFound(int value) {
    _styleRollUp1StFound = value;
  }

  List<FirstMarkupStyleModel> get firstMarkupStyleList => _firstMarkupStyleList;

  set firstMarkupStyleList(List<FirstMarkupStyleModel> value) {
    _firstMarkupStyleList = value;
  }


}