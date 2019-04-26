class TestModel {
  int _numberFound;
  int _numberOutstanding;
  String _description;
  int _numberPossiblySold;
  String _rollup;
  List<TestModel> _testModelList;

//  //singleton
//  static TestModel _testModelInstance;
//
//  //singleton factory method
//  factory TestModel() => _testModelInstance ??= new TestModel._();

  int get numberFound => _numberFound;

  set numberFound(int value) {
    _numberFound = value;
  }

  int get numberOutstanding => _numberOutstanding;

  List<TestModel> get testModelList => _testModelList;

  set testModelList(List<TestModel> value) {
    _testModelList = value;
  }

  String get rollup => _rollup;

  set rollup(String value) {
    _rollup = value;
  }

  int get numberPossiblySold => _numberPossiblySold;

  set numberPossiblySold(int value) {
    _numberPossiblySold = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set numberOutstanding(int value) {
    _numberOutstanding = value;
  }

  static List<TestModel> populateTestList() {

    List<TestModel> testModelList = new List<TestModel>();

    TestModel test = new TestModel();
    test._description = "3c Items";
    test._numberFound = 1500;
    test._numberOutstanding = 1200;
    test._numberPossiblySold = 300;
    test.rollup = "9930/20170(50%) Complete";

    TestModel test2 = new TestModel();
    test2._description = "1st Markdown";
    test2._numberFound = 1500;
    test2._numberOutstanding = 1800;
    test2._numberPossiblySold = 500;
    test2.rollup = "1200/3600(33%) Complete";

    TestModel test3 = new TestModel();
    test3._description = "Mens 3";
    test3._numberFound = 1200;
    test3._numberOutstanding = 1200;
    test3._numberPossiblySold = 1200;
    test3.rollup = "32430/5517(50%) Complete";

    testModelList.insert(0, test);
    testModelList.insert(1, test2);
    testModelList.insert(2, test3);


    return testModelList;
  }
}
