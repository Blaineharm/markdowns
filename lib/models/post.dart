// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Post {
  List<Department> departments;
  int expiryDateEpoch;
  List<dynamic> nsoh;
  int resultCode;

  Post({
    this.departments,
    this.expiryDateEpoch,
    this.nsoh,
    this.resultCode,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    departments: new List<Department>.from(json["Departments"].map((x) => Department.fromJson(x))),
    expiryDateEpoch: json["ExpiryDateEpoch"],
    nsoh: new List<dynamic>.from(json["Nsoh"].map((x) => x)),
    resultCode: json["ResultCode"],
  );

  Map<String, dynamic> toJson() => {
    "Departments": new List<dynamic>.from(departments.map((x) => x.toJson())),
    "ExpiryDateEpoch": expiryDateEpoch,
    "Nsoh": new List<dynamic>.from(nsoh.map((x) => x)),
    "ResultCode": resultCode,
  };
}

class Department {
  List<Category> categories;
  int categoryRollUp1StCurrentRetek;
  int categoryRollUp1StFound;
  int categoryRollUp1StInitialRetek;
  int categoryRollUp3CCurrentRetek;
  int categoryRollUp3CFound;
  int categoryRollUp3CInitialRetek;
  int categoryRollUpOtherCurrentRetek;
  int categoryRollUpOtherFound;
  int categoryRollUpOtherInitialRetek;
  String departmentName;
  String departmentNumber;

  Department({
    this.categories,
    this.categoryRollUp1StCurrentRetek,
    this.categoryRollUp1StFound,
    this.categoryRollUp1StInitialRetek,
    this.categoryRollUp3CCurrentRetek,
    this.categoryRollUp3CFound,
    this.categoryRollUp3CInitialRetek,
    this.categoryRollUpOtherCurrentRetek,
    this.categoryRollUpOtherFound,
    this.categoryRollUpOtherInitialRetek,
    this.departmentName,
    this.departmentNumber,
  });

  factory Department.fromJson(Map<String, dynamic> json) => new Department(
    categories: new List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
    categoryRollUp1StCurrentRetek: json["CategoryRollUp1stCurrentRetek"],
    categoryRollUp1StFound: json["CategoryRollUp1stFound"],
    categoryRollUp1StInitialRetek: json["CategoryRollUp1stInitialRetek"],
    categoryRollUp3CCurrentRetek: json["CategoryRollUp3cCurrentRetek"],
    categoryRollUp3CFound: json["CategoryRollUp3cFound"],
    categoryRollUp3CInitialRetek: json["CategoryRollUp3cInitialRetek"],
    categoryRollUpOtherCurrentRetek: json["CategoryRollUpOtherCurrentRetek"],
    categoryRollUpOtherFound: json["CategoryRollUpOtherFound"],
    categoryRollUpOtherInitialRetek: json["CategoryRollUpOtherInitialRetek"],
    departmentName: json["DepartmentName"],
    departmentNumber: json["DepartmentNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Categories": new List<dynamic>.from(categories.map((x) => x.toJson())),
    "CategoryRollUp1stCurrentRetek": categoryRollUp1StCurrentRetek,
    "CategoryRollUp1stFound": categoryRollUp1StFound,
    "CategoryRollUp1stInitialRetek": categoryRollUp1StInitialRetek,
    "CategoryRollUp3cCurrentRetek": categoryRollUp3CCurrentRetek,
    "CategoryRollUp3cFound": categoryRollUp3CFound,
    "CategoryRollUp3cInitialRetek": categoryRollUp3CInitialRetek,
    "CategoryRollUpOtherCurrentRetek": categoryRollUpOtherCurrentRetek,
    "CategoryRollUpOtherFound": categoryRollUpOtherFound,
    "CategoryRollUpOtherInitialRetek": categoryRollUpOtherInitialRetek,
    "DepartmentName": departmentName,
    "DepartmentNumber": departmentNumber,
  };
}

class Category {
  String categoryName;
  String categoryNumber;
  int rangeRollUp1StCurrentRetek;
  int rangeRollUp1StFound;
  int rangeRollUp1StInitialRetek;
  int rangeRollUp3CCurrentRetek;
  int rangeRollUp3CFound;
  int rangeRollUp3CInitialRetek;
  int rangeRollUpOtherCurrentRetek;
  int rangeRollUpOtherFound;
  int rangeRollUpOtherInitialRetek;
  List<Range> ranges;

  Category({
    this.categoryName,
    this.categoryNumber,
    this.rangeRollUp1StCurrentRetek,
    this.rangeRollUp1StFound,
    this.rangeRollUp1StInitialRetek,
    this.rangeRollUp3CCurrentRetek,
    this.rangeRollUp3CFound,
    this.rangeRollUp3CInitialRetek,
    this.rangeRollUpOtherCurrentRetek,
    this.rangeRollUpOtherFound,
    this.rangeRollUpOtherInitialRetek,
    this.ranges,
  });

  factory Category.fromJson(Map<String, dynamic> json) => new Category(
    categoryName: json["CategoryName"],
    categoryNumber: json["CategoryNumber"],
    rangeRollUp1StCurrentRetek: json["RangeRollUp1stCurrentRetek"],
    rangeRollUp1StFound: json["RangeRollUp1stFound"],
    rangeRollUp1StInitialRetek: json["RangeRollUp1stInitialRetek"],
    rangeRollUp3CCurrentRetek: json["RangeRollUp3cCurrentRetek"],
    rangeRollUp3CFound: json["RangeRollUp3cFound"],
    rangeRollUp3CInitialRetek: json["RangeRollUp3cInitialRetek"],
    rangeRollUpOtherCurrentRetek: json["RangeRollUpOtherCurrentRetek"],
    rangeRollUpOtherFound: json["RangeRollUpOtherFound"],
    rangeRollUpOtherInitialRetek: json["RangeRollUpOtherInitialRetek"],
    ranges: new List<Range>.from(json["Ranges"].map((x) => Range.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CategoryName": categoryName,
    "CategoryNumber": categoryNumber,
    "RangeRollUp1stCurrentRetek": rangeRollUp1StCurrentRetek,
    "RangeRollUp1stFound": rangeRollUp1StFound,
    "RangeRollUp1stInitialRetek": rangeRollUp1StInitialRetek,
    "RangeRollUp3cCurrentRetek": rangeRollUp3CCurrentRetek,
    "RangeRollUp3cFound": rangeRollUp3CFound,
    "RangeRollUp3cInitialRetek": rangeRollUp3CInitialRetek,
    "RangeRollUpOtherCurrentRetek": rangeRollUpOtherCurrentRetek,
    "RangeRollUpOtherFound": rangeRollUpOtherFound,
    "RangeRollUpOtherInitialRetek": rangeRollUpOtherInitialRetek,
    "Ranges": new List<dynamic>.from(ranges.map((x) => x.toJson())),
  };
}

class Range {
  String rangeName;
  String rangeNumber;
  int styleRollUp1StCurrentRetek;
  int styleRollUp1StFound;
  int styleRollUp1StInitialRetek;
  int styleRollUp3CCurrentRetek;
  int styleRollUp3CFound;
  int styleRollUp3CInitialRetek;
  int styleRollUpOtherCurrentRetek;
  int styleRollUpOtherFound;
  int styleRollUpOtherInitialRetek;
  List<Style> styles;

  Range({
    this.rangeName,
    this.rangeNumber,
    this.styleRollUp1StCurrentRetek,
    this.styleRollUp1StFound,
    this.styleRollUp1StInitialRetek,
    this.styleRollUp3CCurrentRetek,
    this.styleRollUp3CFound,
    this.styleRollUp3CInitialRetek,
    this.styleRollUpOtherCurrentRetek,
    this.styleRollUpOtherFound,
    this.styleRollUpOtherInitialRetek,
    this.styles,
  });

  factory Range.fromJson(Map<String, dynamic> json) => new Range(
    rangeName: json["RangeName"],
    rangeNumber: json["RangeNumber"],
    styleRollUp1StCurrentRetek: json["StyleRollUp1stCurrentRetek"],
    styleRollUp1StFound: json["StyleRollUp1stFound"],
    styleRollUp1StInitialRetek: json["StyleRollUp1stInitialRetek"],
    styleRollUp3CCurrentRetek: json["StyleRollUp3cCurrentRetek"],
    styleRollUp3CFound: json["StyleRollUp3cFound"],
    styleRollUp3CInitialRetek: json["StyleRollUp3cInitialRetek"],
    styleRollUpOtherCurrentRetek: json["StyleRollUpOtherCurrentRetek"],
    styleRollUpOtherFound: json["StyleRollUpOtherFound"],
    styleRollUpOtherInitialRetek: json["StyleRollUpOtherInitialRetek"],
    styles: new List<Style>.from(json["Styles"].map((x) => Style.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RangeName": rangeName,
    "RangeNumber": rangeNumber,
    "StyleRollUp1stCurrentRetek": styleRollUp1StCurrentRetek,
    "StyleRollUp1stFound": styleRollUp1StFound,
    "StyleRollUp1stInitialRetek": styleRollUp1StInitialRetek,
    "StyleRollUp3cCurrentRetek": styleRollUp3CCurrentRetek,
    "StyleRollUp3cFound": styleRollUp3CFound,
    "StyleRollUp3cInitialRetek": styleRollUp3CInitialRetek,
    "StyleRollUpOtherCurrentRetek": styleRollUpOtherCurrentRetek,
    "StyleRollUpOtherFound": styleRollUpOtherFound,
    "StyleRollUpOtherInitialRetek": styleRollUpOtherInitialRetek,
    "Styles": new List<dynamic>.from(styles.map((x) => x.toJson())),
  };
}

class Style {
  double currentPrice;
  int currentRetekAmount;
  int foundAmount;
  double initialPrice;
  int initialRetekAmount;
  bool is3C;
  int markdownNumber;
  int soldAmount;
  String styleDescription;
  String styleNumber;

  Style({
    this.currentPrice,
    this.currentRetekAmount,
    this.foundAmount,
    this.initialPrice,
    this.initialRetekAmount,
    this.is3C,
    this.markdownNumber,
    this.soldAmount,
    this.styleDescription,
    this.styleNumber,
  });

  factory Style.fromJson(Map<String, dynamic> json) => new Style(
    currentPrice: json["CurrentPrice"].toDouble(),
    currentRetekAmount: json["CurrentRetekAmount"],
    foundAmount: json["FoundAmount"],
    initialPrice: json["InitialPrice"].toDouble(),
    initialRetekAmount: json["InitialRetekAmount"],
    is3C: json["Is3c"],
    markdownNumber: json["MarkdownNumber"],
    soldAmount: json["SoldAmount"],
    styleDescription: json["StyleDescription"],
    styleNumber: json["StyleNumber"],
  );

  Map<String, dynamic> toJson() => {
    "CurrentPrice": currentPrice,
    "CurrentRetekAmount": currentRetekAmount,
    "FoundAmount": foundAmount,
    "InitialPrice": initialPrice,
    "InitialRetekAmount": initialRetekAmount,
    "Is3c": is3C,
    "MarkdownNumber": markdownNumber,
    "SoldAmount": soldAmount,
    "StyleDescription": styleDescription,
    "StyleNumber": styleNumber,
  };
}
