import 'package:flutter/material.dart';
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';
import 'package:markdowns/models/threeccategorymodel.dart';
import 'package:markdowns/models/OtherCategoryModel.dart';
import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/markdownstylemodel.dart';
import 'package:markdowns/models/firstmarkdowndepartmentmodel.dart';
import 'package:markdowns/models/threecdepartmentmodel.dart';
import 'package:markdowns/models/otherdepartmentmodel.dart';


class DepartmentModel {
  int _currentRollup1st = 0;
  int _initialRollup3c = 0;
  int _initialRollup1st = 0;
  int _currentRollup3c = 0;
  int _initialRollupOther = 0;
  int _currentRollupOther = 0;
  int _firstMarkdownFound = 0;
  int _threeCFound = 0;
  int _otherFound = 0;
  int _Sold1st = 0;
  int _Sold3c = 0;
  int _SoldOther = 0;
  int _sold = 0;
  int _outstanding1st = 0;
  int _outstanding3c = 0;
  int _outstandingOther = 0;
  String _departmentName = "";
  String _departmentNumber = "";

  List<FirstMarkdownDepartmentModel> _firstMarkdownDepratmentModelList = new List();
  List<ThreeCDepartmentModel> _threeCDepartmentModel = new List();
  List<OtherDepartmentModel> _otherDepartmentModel = new List();
  List<FirstMarkdownCategoryModel> _firstMarkdownCategoryList = new List();
  List<ThreeCCategoryModel> _threeCCategoryList = new List();
  List<OtherCategoryModel> _otherCategoryList = new List();
  List<DepartmentModel> _listOfDepartments = new List();

  DepartmentModel();

  int calculateOutstanding(int initialRollup, int sold, int found) {
    int initTemp = initialRollup;
    int soldTemp = sold;
    int foundTemp = found;

    if (initTemp == null) {
      initTemp = 0;
    } else if (soldTemp == null) {
      soldTemp = 0;
    } else if (foundTemp == null) {
      foundTemp = 0;
    }

    return initTemp - soldTemp - foundTemp;
  }

  int calcSold(int initialRollup, int currentRollup) {
    return initialRollup - currentRollup;
  }

  void populateModelLists(Post p) {
    _firstMarkdownCategoryList = new List();
    _threeCCategoryList = new List();
    _otherCategoryList = new List();

    for (Department department in p.departments) {
      //create new department object and add to departmentModel list
      FirstMarkdownDepartmentModel firstMarkdownDepartmentModel = new FirstMarkdownDepartmentModel();
      ThreeCDepartmentModel threeCDepartmentModel = new ThreeCDepartmentModel();
      OtherDepartmentModel otherDepartmentModel = new OtherDepartmentModel();

      DepartmentModel departmentModelObj = new DepartmentModel();

      departmentModelObj._departmentName  = department.departmentName;
      departmentModelObj._departmentNumber = department.departmentNumber;
      firstMarkdownDepartmentModel.departmentName  = department.departmentName;
      firstMarkdownDepartmentModel.departmentNumber = department.departmentNumber;
      threeCDepartmentModel.departmentName  = department.departmentName;
      threeCDepartmentModel.departmentNumber = department.departmentNumber;
      otherDepartmentModel.departmentName = department.departmentName;
      otherDepartmentModel.departmentNumber = department.departmentNumber;

      departmentModelObj._currentRollup1st =
          department.categoryRollUp1StCurrentRetek;
      departmentModelObj._initialRollup1st =
          department.categoryRollUp1StInitialRetek;
      firstMarkdownDepartmentModel.currentRollup1st =
          department.categoryRollUp1StCurrentRetek;
      firstMarkdownDepartmentModel.initialRollup1st =
          department.categoryRollUp1StInitialRetek;

      departmentModelObj._initialRollup3c =
          department.categoryRollUp3CInitialRetek;
      departmentModelObj._currentRollup3c =
          department.categoryRollUp3CCurrentRetek;
      threeCDepartmentModel.initialRollup3c =
          department.categoryRollUp3CInitialRetek;
      threeCDepartmentModel.currentRollup3c =
          department.categoryRollUp3CCurrentRetek;

      departmentModelObj._initialRollupOther =
          department.categoryRollUpOtherInitialRetek;
      departmentModelObj._currentRollupOther =
          department.categoryRollUpOtherCurrentRetek;
      otherDepartmentModel.initialRollupOther =
          department.categoryRollUpOtherInitialRetek;
      otherDepartmentModel.currentRollupOther =
          department.categoryRollUpOtherCurrentRetek;

      departmentModelObj._firstMarkdownFound =
          department.categoryRollUp1StFound;
      firstMarkdownDepartmentModel.firstMarkdownFound =
          department.categoryRollUp1StFound;

      departmentModelObj._threeCFound = department.categoryRollUp3CFound;
      threeCDepartmentModel.threeCFound = department.categoryRollUp3CFound;

      departmentModelObj._otherFound = department.categoryRollUpOtherFound;
      otherDepartmentModel.otherFound = department.categoryRollUpOtherFound;

      departmentModelObj._Sold1st = calcSold(
          departmentModelObj._initialRollup1st,
          departmentModelObj._currentRollup1st);
      firstMarkdownDepartmentModel.Sold1st = calcSold(
          departmentModelObj._initialRollup1st,
          departmentModelObj._currentRollup1st);

      departmentModelObj._Sold3c = calcSold(departmentModelObj._initialRollup3c,
          departmentModelObj._currentRollup3c);
      threeCDepartmentModel.Sold3c = calcSold(departmentModelObj._initialRollup3c,
          departmentModelObj._currentRollup3c);

      departmentModelObj._SoldOther = calcSold(
          departmentModelObj._initialRollupOther,
          departmentModelObj._currentRollupOther);
      otherDepartmentModel.SoldOther = calcSold(
          departmentModelObj._initialRollupOther,
          departmentModelObj._currentRollupOther);

      departmentModelObj._outstanding1st = calculateOutstanding(
          departmentModelObj._initialRollup1st,
          departmentModelObj._Sold1st,
          departmentModelObj._firstMarkdownFound);
      firstMarkdownDepartmentModel.outstanding1st = calculateOutstanding(
          departmentModelObj._initialRollup1st,
          departmentModelObj._Sold1st,
          departmentModelObj._firstMarkdownFound);

      departmentModelObj._outstanding3c = calculateOutstanding(
          departmentModelObj._initialRollup3c,
          departmentModelObj._Sold3c,
          departmentModelObj._threeCFound);
      threeCDepartmentModel.outstanding3c = calculateOutstanding(
          departmentModelObj._initialRollup3c,
          departmentModelObj._Sold3c,
          departmentModelObj._threeCFound);

      departmentModelObj._outstandingOther = calculateOutstanding(
          departmentModelObj._initialRollupOther,
          departmentModelObj._SoldOther,
          departmentModelObj._otherFound);
      otherDepartmentModel.outstandingOther = calculateOutstanding(
          departmentModelObj._initialRollupOther,
          departmentModelObj._SoldOther,
          departmentModelObj._otherFound);

      //this._listOfDepartments.add(departmentModelObj);

      //departments

      //1st and 3c
      if (department.categoryRollUp1StInitialRetek != 0) {
        if (department.categoryRollUp3CInitialRetek != 0 &&
            department.categoryRollUpOtherInitialRetek == 0) {
          for (Category category in department.categories) {
            FirstMarkdownCategoryModel firstMarkdownCategoryModel =
                new FirstMarkdownCategoryModel(
                    category.categoryName,
                    category.categoryName,
                    category.rangeRollUp1StCurrentRetek,
                    category.rangeRollUp1StFound,
                    category.rangeRollUp1StInitialRetek);
            firstMarkdownCategoryModel.rangeRolledUp1stSold = calcSold(
                firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                firstMarkdownCategoryModel.rangeRollUp1stCurrentRetek);
            firstMarkdownCategoryModel.rangeRollUp1stOutstanding =
                calculateOutstanding(
                    firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                    firstMarkdownCategoryModel.rangeRolledUp1stSold,
                    firstMarkdownCategoryModel.rangeRollUp1stFound);

            ///
            departmentModelObj.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);
            firstMarkdownDepartmentModel.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            ThreeCCategoryModel threeCCategoryModel = new ThreeCCategoryModel();
            threeCCategoryModel.categoryName = category.categoryName;
            threeCCategoryModel.rangeRollUp3cCurrentRetek =
                category.rangeRollUp3CCurrentRetek;
            threeCCategoryModel.rangeRollUp3cinitialRetek =
                category.rangeRollUp3CInitialRetek;
            threeCCategoryModel.rangeRollUp3cFound =
                category.rangeRollUp3CFound;
            threeCCategoryModel.rangeRolledUpc3Sold = calcSold(
                threeCCategoryModel.rangeRollUp3cinitialRetek,
                threeCCategoryModel.rangeRollUp3cCurrentRetek);
            threeCCategoryModel.rangeRolledUp3cOutstanding =
                calculateOutstanding(
                    threeCCategoryModel.rangeRollUp3cinitialRetek,
                    threeCCategoryModel.rangeRolledUpc3Sold,
                    threeCCategoryModel.rangeRollUp3cFound);

            ///
            departmentModelObj.threeCCategoryList.add(threeCCategoryModel);
            threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);

            for (Range range in category.ranges) {
              MarkdownRangeModel markdownRange1st = new MarkdownRangeModel();
              MarkdownRangeModel markdownRange3c = new MarkdownRangeModel();

              //1st
              markdownRange1st.rangeName = range.rangeName;
              markdownRange1st.rangeNumber = range.rangeNumber;
              markdownRange1st.styleRollUp1StCurrentRetek =
                  range.styleRollUp1StCurrentRetek;
              markdownRange1st.styleRollUp1StInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange1st.styleRollUp1StFound = range.styleRollUp1StFound;
              markdownRange1st.styleRollUp1StFound = calcSold(
                  markdownRange1st.styleRollUp1StInitialRetek,
                  markdownRange1st.styleRollUp1StCurrentRetek);
              markdownRange1st.outstanding1st = calculateOutstanding(
                  markdownRange1st._initialRollup1st,
                  markdownRange1st.Sold1st,
                  markdownRange1st.firstMarkdownFound);

              //c3
              markdownRange3c.rangeName = range.rangeName;
              markdownRange3c.rangeNumber = range.rangeNumber;
              markdownRange3c.styleRollUp3CCurrentRetek =
                  range.styleRollUp3CCurrentRetek;
              markdownRange3c.styleRollUp3CInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange3c.styleRollUp3CFound = range.styleRollUp3CFound;
              markdownRange3c.styleRolledUp3CSold = calcSold(
                  markdownRange3c.styleRollUp3CInitialRetek,
                  markdownRange3c.styleRollUp3CCurrentRetek);
              markdownRange3c.outstanding3c = calculateOutstanding(
                  markdownRange3c._initialRollup3c,
                  markdownRange3c.Sold3c,
                  markdownRange3c.threeCFound);

              ///
              departmentModelObj.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              departmentModelObj.threeCCategoryList.first.ranges
                  .add(markdownRange3c);

              firstMarkdownDepartmentModel.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              threeCDepartmentModel.threeCCategoryList.first.ranges
                  .add(markdownRange3c);



              for (Style style in range.styles) {
                MarkdownStyleModel markdownStyleModel =
                    new MarkdownStyleModel();

                markdownStyleModel.currentPrice = style.currentPrice;
                markdownStyleModel.currentRetekAmount =
                    style.currentRetekAmount;
                markdownStyleModel.foundAmount = style.foundAmount;
                markdownStyleModel.initialPrice = style.initialPrice;
                markdownStyleModel.initialRetekAmount =
                    style.initialRetekAmount;
                markdownStyleModel.is3C = style.is3C;
                markdownStyleModel.soldAmount = style.soldAmount;
                markdownStyleModel.styleDescription = style.styleDescription;
                markdownStyleModel.styleNumber = style.styleNumber;

                //add style model to separate range models
                ///
                departmentModelObj
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                departmentModelObj
                    .threeCCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);

                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                threeCDepartmentModel
                    .threeCCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
              } //style for each

            } //ranges for each

          } //category for each

        } else if (department.categoryRollUpOtherCurrentRetek != 0 &&
            department.categoryRollUp3CInitialRetek == 0) {
          for (Category category in department.categories) {
            FirstMarkdownCategoryModel firstMarkdownCategoryModel =
                new FirstMarkdownCategoryModel(
                    category.categoryName,
                    category.categoryName,
                    category.rangeRollUp1StCurrentRetek,
                    category.rangeRollUp1StFound,
                    category.rangeRollUp1StInitialRetek);
            firstMarkdownCategoryModel.rangeRolledUp1stSold = calcSold(
                firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                firstMarkdownCategoryModel.rangeRollUp1stCurrentRetek);
            firstMarkdownCategoryModel.rangeRollUp1stOutstanding =
                calculateOutstanding(
                    firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                    firstMarkdownCategoryModel.rangeRolledUp1stSold,
                    firstMarkdownCategoryModel.rangeRollUp1stFound);
            ///
            departmentModelObj.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);
            firstMarkdownDepartmentModel.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            OtherCategoryModel otherCategoryModel = new OtherCategoryModel();
            otherCategoryModel.categoryName = category.categoryName;
            otherCategoryModel.categoryNumber = category.categoryNumber;
            otherCategoryModel.rangeRollOtherCurrentRetek =
                category.rangeRollUpOtherCurrentRetek;
            otherCategoryModel.rangeRollUpOtherinitialRetek =
                category.rangeRollUpOtherInitialRetek;
            otherCategoryModel.rangeRollUpOtherFound =
                category.rangeRollUpOtherFound;

            otherCategoryModel.rangeRolledUpOtherSold = calcSold(
                otherCategoryModel.rangeRollUpOtherinitialRetek,
                otherCategoryModel.rangeRollOtherCurrentRetek);
            otherCategoryModel.rangeRolledOtherOutstanding =
                calculateOutstanding(
                    otherCategoryModel.rangeRollOtherCurrentRetek,
                    otherCategoryModel.rangeRolledUpOtherSold,
                    otherCategoryModel.rangeRollUpOtherFound);

            ///
            departmentModelObj.otherCategoryList.add(otherCategoryModel);
            otherDepartmentModel.otherCategoryList.add(otherCategoryModel);

            for (Range range in category.ranges) {
              MarkdownRangeModel markdownRange1st = new MarkdownRangeModel();
              MarkdownRangeModel markdownRangeOther = new MarkdownRangeModel();

              //1st
              markdownRange1st.rangeName = range.rangeName;
              markdownRange1st.rangeNumber = range.rangeNumber;
              markdownRange1st.styleRollUp1StCurrentRetek =
                  range.styleRollUp1StCurrentRetek;
              markdownRange1st.styleRollUp1StInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange1st.styleRollUp1StFound = range.styleRollUp1StFound;
              markdownRange1st.styleRollUp1StFound = calcSold(
                  markdownRange1st.styleRollUp1StInitialRetek,
                  markdownRange1st.styleRollUp1StCurrentRetek);
              markdownRange1st.styleRolledUp1stOutstanding =
                  calculateOutstanding(
                      markdownRange1st.styleRollUp1StInitialRetek,
                      markdownRange1st.styleRolledUp1stSold,
                      markdownRange1st.styleRollUp1StFound);

              //other
              markdownRangeOther.rangeName = range.rangeName;
              markdownRangeOther.rangeNumber = range.rangeNumber;
              markdownRangeOther.styleRollUpOtherCurrentRetek =
                  range.styleRollUpOtherCurrentRetek;
              markdownRangeOther.styleRollUpOtherInitialRetek =
                  range.styleRollUpOtherInitialRetek;
              markdownRangeOther.styleRollUpOtherFound =
                  range.styleRollUpOtherFound;
              markdownRangeOther.styleRolledUpOtherSold = calcSold(
                  markdownRangeOther.styleRollUpOtherInitialRetek,
                  markdownRangeOther.styleRollUpOtherCurrentRetek);
              markdownRangeOther.styleRolledUpOtherOutstanding =
                  calculateOutstanding(
                      markdownRangeOther.styleRollUpOtherInitialRetek,
                      markdownRangeOther.styleRolledUpOtherSold,
                      markdownRangeOther.styleRollUpOtherFound);

              ///
              departmentModelObj.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              departmentModelObj.otherCategoryList.first.ranges
                  .add(markdownRangeOther);

              firstMarkdownDepartmentModel.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              otherDepartmentModel.otherCategoryList.first.ranges
                  .add(markdownRangeOther);

              for (Style style in range.styles) {
                MarkdownStyleModel markdownStyleModel =
                    new MarkdownStyleModel();

                markdownStyleModel.currentPrice = style.currentPrice;
                markdownStyleModel.currentRetekAmount =
                    style.currentRetekAmount;
                markdownStyleModel.foundAmount = style.foundAmount;
                markdownStyleModel.initialPrice = style.initialPrice;
                markdownStyleModel.initialRetekAmount =
                    style.initialRetekAmount;
                markdownStyleModel.is3C = style.is3C;
                markdownStyleModel.soldAmount = style.soldAmount;
                markdownStyleModel.styleDescription = style.styleDescription;
                markdownStyleModel.styleNumber = style.styleNumber;

                ///
                departmentModelObj
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                departmentModelObj
                    .otherCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);

                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                otherDepartmentModel
                    .otherCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
              } //style for each

            } //ranges for each

          } //category for each
        } else if (department.categoryRollUp3CInitialRetek == 0 &&
            department.categoryRollUpOtherInitialRetek == 0) {
          for (Category category in department.categories) {
            FirstMarkdownCategoryModel firstMarkdownCategoryModel =
                new FirstMarkdownCategoryModel(
                    category.categoryName,
                    category.categoryName,
                    category.rangeRollUp1StCurrentRetek,
                    category.rangeRollUp1StFound,
                    category.rangeRollUp1StInitialRetek);
            firstMarkdownCategoryModel.rangeRolledUp1stSold = calcSold(
                firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                firstMarkdownCategoryModel.rangeRollUp1stCurrentRetek);
            firstMarkdownCategoryModel.rangeRollUp1stOutstanding =
                calculateOutstanding(
                    firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                    firstMarkdownCategoryModel.rangeRolledUp1stSold,
                    firstMarkdownCategoryModel.rangeRollUp1stFound);

            ///
            departmentModelObj.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            firstMarkdownDepartmentModel.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            for (Range range in category.ranges) {
              MarkdownRangeModel markdownRange1st = new MarkdownRangeModel();

              //1st range
              markdownRange1st.rangeName = range.rangeName;
              markdownRange1st.rangeNumber = range.rangeNumber;
              markdownRange1st.styleRollUp1StCurrentRetek =
                  range.styleRollUp1StCurrentRetek;
              markdownRange1st.styleRollUp1StInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange1st.styleRollUp1StFound = range.styleRollUp1StFound;
              markdownRange1st.styleRollUp1StFound = calcSold(
                  markdownRange1st.styleRollUp1StInitialRetek,
                  markdownRange1st.styleRollUp1StCurrentRetek);
              markdownRange1st.styleRolledUp1stOutstanding =
                  calculateOutstanding(
                      markdownRange1st.styleRollUp1StInitialRetek,
                      markdownRange1st.styleRolledUp1stSold,
                      markdownRange1st.styleRollUp1StFound);

              //Add range model to separate catalogue models
              ///
              departmentModelObj.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);

              firstMarkdownDepartmentModel.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);

              for (Style style in range.styles) {
                MarkdownStyleModel markdownStyleModel =
                    new MarkdownStyleModel();

                markdownStyleModel.currentPrice = style.currentPrice;
                markdownStyleModel.currentRetekAmount =
                    style.currentRetekAmount;
                markdownStyleModel.foundAmount = style.foundAmount;
                markdownStyleModel.initialPrice = style.initialPrice;
                markdownStyleModel.initialRetekAmount =
                    style.initialRetekAmount;
                markdownStyleModel.is3C = style.is3C;
                markdownStyleModel.soldAmount = style.soldAmount;
                markdownStyleModel.styleDescription = style.styleDescription;
                markdownStyleModel.styleNumber = style.styleNumber;

                ///
                departmentModelObj
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);

                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
              } //style for each

            } //ranges for each

          } //category for each

        } else if (department.categoryRollUp3CInitialRetek != 0 &&
            department.categoryRollUpOtherInitialRetek != 0) {
          for (Category category in department.categories) {
            FirstMarkdownCategoryModel firstMarkdownCategoryModel =
                new FirstMarkdownCategoryModel(
                    category.categoryName,
                    category.categoryName,
                    category.rangeRollUp1StCurrentRetek,
                    category.rangeRollUp1StFound,
                    category.rangeRollUp1StInitialRetek);
            firstMarkdownCategoryModel.rangeRolledUp1stSold = calcSold(
                firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                firstMarkdownCategoryModel.rangeRollUp1stCurrentRetek);
            firstMarkdownCategoryModel.rangeRollUp1stOutstanding =
                calculateOutstanding(
                    firstMarkdownCategoryModel.rangeRollUp1stinitialRetek,
                    firstMarkdownCategoryModel.rangeRolledUp1stSold,
                    firstMarkdownCategoryModel.rangeRollUp1stFound);

            ///
            departmentModelObj.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            firstMarkdownDepartmentModel.firstMarkdownCategoryList
                .add(firstMarkdownCategoryModel);

            ThreeCCategoryModel threeCCategoryModel = new ThreeCCategoryModel();
            threeCCategoryModel.categoryName = category.categoryName;
            threeCCategoryModel.rangeRollUp3cCurrentRetek =
                category.rangeRollUp3CCurrentRetek;
            threeCCategoryModel.rangeRollUp3cinitialRetek =
                category.rangeRollUp3CInitialRetek;
            threeCCategoryModel.rangeRollUp3cFound =
                category.rangeRollUp3CFound;
            threeCCategoryModel.rangeRolledUpc3Sold = calcSold(
                threeCCategoryModel.rangeRollUp3cinitialRetek,
                threeCCategoryModel.rangeRollUp3cCurrentRetek);
            threeCCategoryModel.rangeRolledUp3cOutstanding =
                calculateOutstanding(
                    threeCCategoryModel.rangeRollUp3cinitialRetek,
                    threeCCategoryModel.rangeRolledUpc3Sold,
                    threeCCategoryModel.rangeRollUp3cFound);

            ///
            departmentModelObj.threeCCategoryList.add(threeCCategoryModel);
            threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);

            OtherCategoryModel otherCategoryModel = new OtherCategoryModel();
            otherCategoryModel.categoryName = category.categoryName;
            otherCategoryModel.categoryNumber = category.categoryNumber;
            otherCategoryModel.rangeRollOtherCurrentRetek =
                category.rangeRollUpOtherCurrentRetek;
            otherCategoryModel.rangeRollUpOtherinitialRetek =
                category.rangeRollUpOtherInitialRetek;
            otherCategoryModel.rangeRollUpOtherFound =
                category.rangeRollUpOtherFound;

            otherCategoryModel.rangeRolledUpOtherSold = calcSold(
                otherCategoryModel.rangeRollUpOtherinitialRetek,
                otherCategoryModel.rangeRollOtherCurrentRetek);
            otherCategoryModel.rangeRolledOtherOutstanding =
                calculateOutstanding(
                    otherCategoryModel.rangeRollOtherCurrentRetek,
                    otherCategoryModel.rangeRolledUpOtherSold,
                    otherCategoryModel.rangeRollUpOtherFound);
            ///
            departmentModelObj.otherCategoryList.add(otherCategoryModel);
            otherDepartmentModel.otherCategoryList.add(otherCategoryModel);

            for (Range range in category.ranges) {
              MarkdownRangeModel markdownRange1st = new MarkdownRangeModel();
              MarkdownRangeModel markdownRange3c = new MarkdownRangeModel();
              MarkdownRangeModel markdownRangeOther = new MarkdownRangeModel();

              //1st
              markdownRange1st.rangeName = range.rangeName;
              markdownRange1st.rangeNumber = range.rangeNumber;
              markdownRange1st.styleRollUp1StCurrentRetek =
                  range.styleRollUp1StCurrentRetek;
              markdownRange1st.styleRollUp1StInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange1st.styleRollUp1StFound = range.styleRollUp1StFound;
              markdownRange1st.styleRollUp1StFound = calcSold(
                  markdownRange1st.styleRollUp1StInitialRetek,
                  markdownRange1st.styleRollUp1StCurrentRetek);
              markdownRange1st.styleRolledUp1stOutstanding =
                  calculateOutstanding(
                      markdownRange1st.styleRollUp1StInitialRetek,
                      markdownRange1st.styleRolledUp1stSold,
                      markdownRange1st.styleRollUp1StFound);

              //c3
              markdownRange3c.rangeName = range.rangeName;
              markdownRange3c.rangeNumber = range.rangeNumber;
              markdownRange3c.styleRollUp3CCurrentRetek =
                  range.styleRollUp3CCurrentRetek;
              markdownRange3c.styleRollUp3CInitialRetek =
                  range.styleRollUp1StInitialRetek;
              markdownRange3c.styleRollUp3CFound = range.styleRollUp3CFound;
              markdownRange3c.styleRolledUp3CSold = calcSold(
                  markdownRange3c.styleRollUp3CInitialRetek,
                  markdownRange3c.styleRollUp3CCurrentRetek);
              markdownRange3c.styleRolledUp3cOutstanding = calculateOutstanding(
                  markdownRange3c.styleRollUp3CInitialRetek,
                  markdownRange3c.styleRolledUp3CSold,
                  markdownRange3c.styleRollUp3CFound);

              //other
              markdownRangeOther.rangeName = range.rangeName;
              markdownRangeOther.rangeNumber = range.rangeNumber;
              markdownRangeOther.styleRollUpOtherCurrentRetek =
                  range.styleRollUpOtherCurrentRetek;
              markdownRangeOther.styleRollUpOtherInitialRetek =
                  range.styleRollUpOtherInitialRetek;
              markdownRangeOther.styleRollUpOtherFound =
                  range.styleRollUpOtherFound;
              markdownRangeOther.styleRolledUpOtherSold = calcSold(
                  markdownRangeOther.styleRollUpOtherInitialRetek,
                  markdownRangeOther.styleRollUpOtherCurrentRetek);
              markdownRangeOther.styleRolledUpOtherOutstanding =
                  calculateOutstanding(
                      markdownRangeOther.styleRollUpOtherInitialRetek,
                      markdownRangeOther.styleRolledUpOtherSold,
                      markdownRangeOther.styleRollUpOtherFound);

              //Add range model to separate catalogue models
              ///
              departmentModelObj.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              departmentModelObj.otherCategoryList.first.ranges
                  .add(markdownRangeOther);
              departmentModelObj.threeCCategoryList.first.ranges
                  .add(markdownRange3c);

              firstMarkdownDepartmentModel.firstMarkdownCategoryList.first.ranges
                  .add(markdownRange1st);
              otherDepartmentModel.otherCategoryList.first.ranges
                  .add(markdownRangeOther);
              threeCDepartmentModel.threeCCategoryList.first.ranges
                  .add(markdownRange3c);

              for (Style style in range.styles) {
                MarkdownStyleModel markdownStyleModel =
                    new MarkdownStyleModel();

                markdownStyleModel.currentPrice = style.currentPrice;
                markdownStyleModel.currentRetekAmount =
                    style.currentRetekAmount;
                markdownStyleModel.foundAmount = style.foundAmount;
                markdownStyleModel.initialPrice = style.initialPrice;
                markdownStyleModel.initialRetekAmount =
                    style.initialRetekAmount;
                markdownStyleModel.is3C = style.is3C;
                markdownStyleModel.soldAmount = style.soldAmount;
                markdownStyleModel.styleDescription = style.styleDescription;
                markdownStyleModel.styleNumber = style.styleNumber;

                //add style model to separate range model
                ///
                departmentModelObj
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                departmentModelObj
                    .threeCCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                departmentModelObj
                    .otherCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);

                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                threeCDepartmentModel
                    .threeCCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
                otherDepartmentModel
                    .otherCategoryList.first.ranges.first.styles
                    .add(markdownStyleModel);
              } //style for each

            } //ranges for each

          } //category for each
        }
      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUpOtherInitialRetek != 0 &&
          department.categoryRollUp3CInitialRetek != 0) {
        for (Category category in department.categories) {
          OtherCategoryModel otherCategoryModel = new OtherCategoryModel();
          otherCategoryModel.categoryName = category.categoryName;
          otherCategoryModel.categoryNumber = category.categoryNumber;
          otherCategoryModel.rangeRollOtherCurrentRetek =
              category.rangeRollUpOtherCurrentRetek;
          otherCategoryModel.rangeRollUpOtherinitialRetek =
              category.rangeRollUpOtherInitialRetek;
          otherCategoryModel.rangeRollUpOtherFound =
              category.rangeRollUpOtherFound;

          otherCategoryModel.rangeRolledUpOtherSold = calcSold(
              otherCategoryModel.rangeRollUpOtherinitialRetek,
              otherCategoryModel.rangeRollOtherCurrentRetek);
          otherCategoryModel.rangeRolledOtherOutstanding = calculateOutstanding(
              otherCategoryModel.rangeRollOtherCurrentRetek,
              otherCategoryModel.rangeRolledUpOtherSold,
              otherCategoryModel.rangeRollUpOtherFound);

          ///
          departmentModelObj.otherCategoryList.add(otherCategoryModel);
          otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
          //other

          for (Range range in category.ranges) {
            MarkdownRangeModel markdownRangeOther = new MarkdownRangeModel();

            //other
            markdownRangeOther.rangeName = range.rangeName;
            markdownRangeOther.rangeNumber = range.rangeNumber;
            markdownRangeOther.styleRollUpOtherCurrentRetek =
                range.styleRollUpOtherCurrentRetek;
            markdownRangeOther.styleRollUpOtherInitialRetek =
                range.styleRollUpOtherInitialRetek;
            markdownRangeOther.styleRollUpOtherFound =
                range.styleRollUpOtherFound;
            markdownRangeOther.styleRolledUpOtherSold = calcSold(
                markdownRangeOther.styleRollUpOtherInitialRetek,
                markdownRangeOther.styleRollUpOtherCurrentRetek);
            markdownRangeOther.styleRolledUpOtherOutstanding =
                calculateOutstanding(
                    markdownRangeOther.styleRollUpOtherInitialRetek,
                    markdownRangeOther.styleRolledUpOtherSold,
                    markdownRangeOther.styleRollUpOtherFound);
            ///
            departmentModelObj.otherCategoryList.first.ranges
                .add(markdownRangeOther);
            otherDepartmentModel.otherCategoryList.first.ranges
                .add(markdownRangeOther);
            //Add range model to separate catalogue models

            for (Style style in range.styles) {
              MarkdownStyleModel markdownStyleModel = new MarkdownStyleModel();

              markdownStyleModel.currentPrice = style.currentPrice;
              markdownStyleModel.currentRetekAmount = style.currentRetekAmount;
              markdownStyleModel.foundAmount = style.foundAmount;
              markdownStyleModel.initialPrice = style.initialPrice;
              markdownStyleModel.initialRetekAmount = style.initialRetekAmount;
              markdownStyleModel.is3C = style.is3C;
              markdownStyleModel.soldAmount = style.soldAmount;
              markdownStyleModel.styleDescription = style.styleDescription;
              markdownStyleModel.styleNumber = style.styleNumber;

              ///
              departmentModelObj.otherCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              otherDepartmentModel.otherCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              //add style model to separate range models

            } //style for each

          } //ranges for each

        } //category for each

      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUp3CInitialRetek != 0 &&
          department.categoryRollUpOtherInitialRetek == 0) {
        for (Category category in department.categories) {
          ThreeCCategoryModel threeCCategoryModel = new ThreeCCategoryModel();
          threeCCategoryModel.categoryName = category.categoryName;
          threeCCategoryModel.rangeRollUp3cCurrentRetek =
              category.rangeRollUp3CCurrentRetek;
          threeCCategoryModel.rangeRollUp3cinitialRetek =
              category.rangeRollUp3CInitialRetek;
          threeCCategoryModel.rangeRollUp3cFound = category.rangeRollUp3CFound;
          threeCCategoryModel.rangeRolledUpc3Sold = calcSold(
              threeCCategoryModel.rangeRollUp3cinitialRetek,
              threeCCategoryModel.rangeRollUp3cCurrentRetek);
          threeCCategoryModel.rangeRolledUp3cOutstanding = calculateOutstanding(
              threeCCategoryModel.rangeRollUp3cinitialRetek,
              threeCCategoryModel.rangeRolledUpc3Sold,
              threeCCategoryModel.rangeRollUp3cFound);

          ///
          departmentModelObj.threeCCategoryList.add(threeCCategoryModel);
          threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
          //3c

          for (Range range in category.ranges) {
            MarkdownRangeModel markdownRange3c = new MarkdownRangeModel();

            //c3
            markdownRange3c.rangeName = range.rangeName;
            markdownRange3c.rangeNumber = range.rangeNumber;
            markdownRange3c.styleRollUp3CCurrentRetek =
                range.styleRollUp3CCurrentRetek;
            markdownRange3c.styleRollUp3CInitialRetek =
                range.styleRollUp1StInitialRetek;
            markdownRange3c.styleRollUp3CFound = range.styleRollUp3CFound;
            markdownRange3c.styleRolledUp3CSold = calcSold(
                markdownRange3c.styleRollUp3CInitialRetek,
                markdownRange3c.styleRollUp3CCurrentRetek);
            markdownRange3c.styleRolledUp3cOutstanding = calculateOutstanding(
                markdownRange3c.styleRollUp3CInitialRetek,
                markdownRange3c.styleRolledUp3CSold,
                markdownRange3c.styleRollUp3CFound);

            ///
            departmentModelObj.threeCCategoryList.first.ranges
                .add(markdownRange3c);
            threeCDepartmentModel.threeCCategoryList.first.ranges
                .add(markdownRange3c);
            //Add range model to separate catalogue models

            for (Style style in range.styles) {
              MarkdownStyleModel markdownStyleModel = new MarkdownStyleModel();

              markdownStyleModel.currentPrice = style.currentPrice;
              markdownStyleModel.currentRetekAmount = style.currentRetekAmount;
              markdownStyleModel.foundAmount = style.foundAmount;
              markdownStyleModel.initialPrice = style.initialPrice;
              markdownStyleModel.initialRetekAmount = style.initialRetekAmount;
              markdownStyleModel.is3C = style.is3C;
              markdownStyleModel.soldAmount = style.soldAmount;
              markdownStyleModel.styleDescription = style.styleDescription;
              markdownStyleModel.styleNumber = style.styleNumber;

              ///
              departmentModelObj
                  .threeCCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              threeCDepartmentModel
                  .threeCCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              //add style model to separate range models

            } //style for each

          } //ranges for each

        } //category for each

      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUp3CInitialRetek != 0 &&
          department.categoryRollUpOtherInitialRetek != 0) {
        for (Category category in department.categories) {
          ThreeCCategoryModel threeCCategoryModel = new ThreeCCategoryModel();
          threeCCategoryModel.categoryName = category.categoryName;
          threeCCategoryModel.rangeRollUp3cCurrentRetek =
              category.rangeRollUp3CCurrentRetek;
          threeCCategoryModel.rangeRollUp3cinitialRetek =
              category.rangeRollUp3CInitialRetek;
          threeCCategoryModel.rangeRollUp3cFound = category.rangeRollUp3CFound;
          threeCCategoryModel.rangeRolledUpc3Sold = calcSold(
              threeCCategoryModel.rangeRollUp3cinitialRetek,
              threeCCategoryModel.rangeRollUp3cCurrentRetek);
          threeCCategoryModel.rangeRolledUp3cOutstanding = calculateOutstanding(
              threeCCategoryModel.rangeRollUp3cinitialRetek,
              threeCCategoryModel.rangeRolledUpc3Sold,
              threeCCategoryModel.rangeRollUp3cFound);

          ///
          departmentModelObj.threeCCategoryList.add(threeCCategoryModel);
          threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
          //3c

          OtherCategoryModel otherCategoryModel = new OtherCategoryModel();
          otherCategoryModel.categoryName = category.categoryName;
          otherCategoryModel.categoryNumber = category.categoryNumber;
          otherCategoryModel.rangeRollOtherCurrentRetek =
              category.rangeRollUpOtherCurrentRetek;
          otherCategoryModel.rangeRollUpOtherinitialRetek =
              category.rangeRollUpOtherInitialRetek;
          otherCategoryModel.rangeRollUpOtherFound =
              category.rangeRollUpOtherFound;

          otherCategoryModel.rangeRolledUpOtherSold = calcSold(
              otherCategoryModel.rangeRollUpOtherinitialRetek,
              otherCategoryModel.rangeRollOtherCurrentRetek);
          otherCategoryModel.rangeRolledOtherOutstanding = calculateOutstanding(
              otherCategoryModel.rangeRollOtherCurrentRetek,
              otherCategoryModel.rangeRolledUpOtherSold,
              otherCategoryModel.rangeRollUpOtherFound);

          ///
          departmentModelObj.otherCategoryList.add(otherCategoryModel);
          otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
          //other

          for (Range range in category.ranges) {
            MarkdownRangeModel markdownRange3c = new MarkdownRangeModel();
            MarkdownRangeModel markdownRangeOther = new MarkdownRangeModel();

            //c3
            markdownRange3c.rangeName = range.rangeName;
            markdownRange3c.rangeNumber = range.rangeNumber;
            markdownRange3c.styleRollUp3CCurrentRetek =
                range.styleRollUp3CCurrentRetek;
            markdownRange3c.styleRollUp3CInitialRetek =
                range.styleRollUp1StInitialRetek;
            markdownRange3c.styleRollUp3CFound = range.styleRollUp3CFound;
            markdownRange3c.styleRolledUp3CSold = calcSold(
                markdownRange3c.styleRollUp3CInitialRetek,
                markdownRange3c.styleRollUp3CCurrentRetek);
            markdownRange3c.styleRolledUp3cOutstanding = calculateOutstanding(
                markdownRange3c.styleRollUp3CInitialRetek,
                markdownRange3c.styleRolledUp3CSold,
                markdownRange3c.styleRollUp3CFound);

            //other range
            markdownRangeOther.rangeName = range.rangeName;
            markdownRangeOther.rangeNumber = range.rangeNumber;
            markdownRangeOther.styleRollUpOtherCurrentRetek =
                range.styleRollUpOtherCurrentRetek;
            markdownRangeOther.styleRollUpOtherInitialRetek =
                range.styleRollUpOtherInitialRetek;
            markdownRangeOther.styleRollUpOtherFound =
                range.styleRollUpOtherFound;
            markdownRangeOther.styleRolledUpOtherSold = calcSold(
                markdownRangeOther.styleRollUpOtherInitialRetek,
                markdownRangeOther.styleRollUpOtherCurrentRetek);
            markdownRangeOther.styleRolledUpOtherOutstanding =
                calculateOutstanding(
                    markdownRangeOther.styleRollUpOtherInitialRetek,
                    markdownRangeOther.styleRolledUpOtherSold,
                    markdownRangeOther.styleRollUpOtherFound);

            //Add range model to separate catalogue models
            ///
            departmentModelObj.threeCCategoryList.first.ranges
                .add(markdownRange3c);
            departmentModelObj.otherCategoryList.first.ranges
                .add(markdownRangeOther);
            threeCDepartmentModel.threeCCategoryList.first.ranges
                .add(markdownRange3c);
            otherDepartmentModel.otherCategoryList.first.ranges
                .add(markdownRangeOther);

            for (Style style in range.styles) {
              MarkdownStyleModel markdownStyleModel = new MarkdownStyleModel();

              markdownStyleModel.currentPrice = style.currentPrice;
              markdownStyleModel.currentRetekAmount = style.currentRetekAmount;
              markdownStyleModel.foundAmount = style.foundAmount;
              markdownStyleModel.initialPrice = style.initialPrice;
              markdownStyleModel.initialRetekAmount = style.initialRetekAmount;
              markdownStyleModel.is3C = style.is3C;
              markdownStyleModel.soldAmount = style.soldAmount;
              markdownStyleModel.styleDescription = style.styleDescription;
              markdownStyleModel.styleNumber = style.styleNumber;

              //add style model to separate range models
              ///
              departmentModelObj
                  .threeCCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              departmentModelObj.otherCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              threeCDepartmentModel
                  .threeCCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
              otherDepartmentModel.otherCategoryList.first.ranges.first.styles
                  .add(markdownStyleModel);
            } //style for each

          } //ranges for each

        } //category for each

      }

      this._listOfDepartments.add(departmentModelObj);
      this._firstMarkdownDepratmentModelList.add(firstMarkdownDepartmentModel);
      this._threeCDepartmentModel.add(threeCDepartmentModel);
      this._otherDepartmentModel.add(otherDepartmentModel);

    } //department for each
    this._firstMarkdownCategoryList = _firstMarkdownCategoryList;
    this._otherCategoryList = _otherCategoryList;
    this._threeCCategoryList = _threeCCategoryList;
  }

  int get currentRollup1st => _currentRollup1st;

  set currentRollup1st(int value) {
    _currentRollup1st = value;
  }

  int get initialRollup3c => _initialRollup3c;

  set initialRollup3c(int value) {
    _initialRollup3c = value;
  }

  int get initialRollup1st => _initialRollup1st;

  set initialRollup1st(int value) {
    _initialRollup1st = value;
  }

  int get currentRollup3c => _currentRollup3c;

  set currentRollup3c(int value) {
    _currentRollup3c = value;
  }

  int get initialRollupOther => _initialRollupOther;

  set initialRollupOther(int value) {
    _initialRollupOther = value;
  }

  int get currentRollupOther => _currentRollupOther;

  set currentRollupOther(int value) {
    _currentRollupOther = value;
  }

  int get firstMarkdownFound => _firstMarkdownFound;

  set firstMarkdownFound(int value) {
    _firstMarkdownFound = value;
  }

  int get sold => _sold;

  set sold(int value) {
    _sold = value;
  }

  String get departmentName => _departmentName;

  set departmentName(String value) {
    _departmentName = value;
  }

  String get departmentNumber => _departmentNumber;

  set departmentNumber(String value) {
    _departmentNumber = value;
  }

  List<ThreeCCategoryModel> get threeCCategoryList => _threeCCategoryList;

  set threeCCategoryList(List<ThreeCCategoryModel> value) {
    _threeCCategoryList = value;
  }

  List<OtherCategoryModel> get otherCategoryList => _otherCategoryList;

  set otherCategoryList(List<OtherCategoryModel> value) {
    _otherCategoryList = value;
  }

  List<DepartmentModel> get listOfDeparments => _listOfDepartments;

  set listOfDeparments(List<DepartmentModel> value) {
    _listOfDepartments = value;
  }

  List<FirstMarkdownCategoryModel> get firstMarkdownCategoryList =>
      _firstMarkdownCategoryList;

  set firstMarkdownCategoryList(List<FirstMarkdownCategoryModel> value) {
    _firstMarkdownCategoryList = value;
  }

  int get threeCFound => _threeCFound;

  set threeCFound(int value) {
    _threeCFound = value;
  }

  int get otherFound => _otherFound;

  set otherFound(int value) {
    _otherFound = value;
  }

  List<DepartmentModel> get listOfDepartments => _listOfDepartments;

  set listOfDepartments(List<DepartmentModel> value) {
    _listOfDepartments = value;
  }

  int get soldOther => _SoldOther;

  set soldOther(int value) {
    _SoldOther = value;
  }

  int get Sold3c => _Sold3c;

  set Sold3c(int value) {
    _Sold3c = value;
  }

  int get Sold1st => _Sold1st;

  set Sold1st(int value) {
    _Sold1st = value;
  }

  int get outstandingOther => _outstandingOther;

  set outstandingOther(int value) {
    _outstandingOther = value;
  }

  int get outstanding3c => _outstanding3c;

  set outstanding3c(int value) {
    _outstanding3c = value;
  }

  int get outstanding1st => _outstanding1st;

  set outstanding1st(int value) {
    _outstanding1st = value;
  }

  int get SoldOther => _SoldOther;

  set SoldOther(int value) {
    _SoldOther = value;
  }
}
