
import 'package:markdowns/models/otherstylemodel.dart';

class OtherRangeModel {

  String rangeName = "";
  String rangeNumber = "";
  int _styleRollUpOtherCurrentRetek = 0;
  int _styleRollUpOtherFound = 0;
  int _styleRollUpOtherInitialRetek = 0;
  int _styleRolledUpOtherSold = 0;
  int _styleRolledUpOtherOutstanding = 0;
  List<OtherStyleModel> _otherStyleModelList = new List();

  int get styleRollUpOtherCurrentRetek => _styleRollUpOtherCurrentRetek;

  set styleRollUpOtherCurrentRetek(int value) {
    _styleRollUpOtherCurrentRetek = value;
  }

  int get styleRollUpOtherFound => _styleRollUpOtherFound;

  int get styleRolledUpOtherOutstanding => _styleRolledUpOtherOutstanding;

  set styleRolledUpOtherOutstanding(int value) {
    _styleRolledUpOtherOutstanding = value;
  }

  int get styleRolledUpOtherSold => _styleRolledUpOtherSold;

  set styleRolledUpOtherSold(int value) {
    _styleRolledUpOtherSold = value;
  }

  int get styleRollUpOtherInitialRetek => _styleRollUpOtherInitialRetek;

  set styleRollUpOtherInitialRetek(int value) {
    _styleRollUpOtherInitialRetek = value;
  }

  set styleRollUpOtherFound(int value) {
    _styleRollUpOtherFound = value;
  }

  List<OtherStyleModel> get otherStyleModelList => _otherStyleModelList;

  set otherStyleModelList(List<OtherStyleModel> value) {
    _otherStyleModelList = value;
  }


}