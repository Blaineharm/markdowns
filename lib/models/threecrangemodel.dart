
import 'package:markdowns/models/threecstylemodel.dart';

class ThreeCRangeModel {

  String rangeName = "";
  String rangeNumber = "";
  int _styleRollUp3CCurrentRetek = 0;
  int _styleRollUp3CFound = 0;
  int _styleRollUp3CInitialRetek = 0;
  int _styleRolledUp3CSold = 0;
  int _styleRolledUp3cOutstanding = 0;
  List<ThreeCStyleModel> _threeCStyleModelList = new List();

  int get styleRollUp3CCurrentRetek => _styleRollUp3CCurrentRetek;

  set styleRollUp3CCurrentRetek(int value) {
    _styleRollUp3CCurrentRetek = value;
  }

  int get styleRollUp3CFound => _styleRollUp3CFound;

  int get styleRolledUp3cOutstanding => _styleRolledUp3cOutstanding;

  set styleRolledUp3cOutstanding(int value) {
    _styleRolledUp3cOutstanding = value;
  }

  int get styleRolledUp3CSold => _styleRolledUp3CSold;

  set styleRolledUp3CSold(int value) {
    _styleRolledUp3CSold = value;
  }

  int get styleRollUp3CInitialRetek => _styleRollUp3CInitialRetek;

  set styleRollUp3CInitialRetek(int value) {
    _styleRollUp3CInitialRetek = value;
  }

  set styleRollUp3CFound(int value) {
    _styleRollUp3CFound = value;
  }

  List<ThreeCStyleModel> get threeCStyleModelList => _threeCStyleModelList;

  set threeCStyleModelList(List<ThreeCStyleModel> value) {
    _threeCStyleModelList = value;
  }


}