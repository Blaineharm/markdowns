import 'package:flutter/material.dart';
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';
import 'package:markdowns/models/threeccategorymodel.dart';
import 'package:markdowns/models/OtherCategoryModel.dart';
import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/firstmarkdowndepartmentmodel.dart';
import 'package:markdowns/models/threecdepartmentmodel.dart';
import 'package:markdowns/models/otherdepartmentmodel.dart';
import 'package:markdowns/models/firstmarkuprangemodel.dart';
import 'package:markdowns/models/firstmarkupstylemodel.dart';
import 'package:markdowns/models/threecrangemodel.dart';
import 'package:markdowns/models/threecstylemodel.dart';
import 'package:markdowns/models/otherrangemodel.dart';
import 'package:markdowns/models/otherstylemodel.dart';

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

  List<FirstMarkdownDepartmentModel> _firstMarkdownDepratmentModelList =
  new List();
  List<ThreeCDepartmentModel> _threeCDepartmentModel = new List();
  List<OtherDepartmentModel> _otherDepartmentModel = new List();
  List<FirstMarkdownCategoryModel> _firstMarkdownCategoryList = new List();
  List<ThreeCCategoryModel> _threeCCategoryList = new List();
  List<OtherCategoryModel> _otherCategoryList = new List();
  List<FirstMarkupRangeModel> _firstRangeList = new List();
  List<FirstMarkupStyleModel> _firstStyleList = new List();
  List<ThreeCRangeModel> _threeCRangeList = new List();
  List<ThreeCStyleModel> _threeCStyleList = new List();
  List<OtherRangeModel> _otherRangeList = new List();
  List<OtherStyleModel> _otherStyleList = new List();
  List<DepartmentModel> _listOfDepartments = new List();

  DepartmentModel();

  int calculateOutstanding(int initialRollup, int sold, int found) {
//    int initTemp = initialRollup;
//    int soldTemp = sold;
//    int foundTemp = found;

//    if (initTemp == null) {
//      initTemp = 0;
//    } else if (soldTemp == null) {
//      soldTemp = 0;
//    } else if (foundTemp == null) {
//      foundTemp = 0;
//    }

//    return initTemp - soldTemp - foundTemp;
    return initialRollup - sold - found;
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
      FirstMarkdownDepartmentModel firstMarkdownDepartmentModel =
      new FirstMarkdownDepartmentModel();
      ThreeCDepartmentModel threeCDepartmentModel = new ThreeCDepartmentModel();
      OtherDepartmentModel otherDepartmentModel = new OtherDepartmentModel();

      DepartmentModel departmentModelObj = new DepartmentModel();

      firstMarkdownDepartmentModel.departmentName = department.departmentName;
      firstMarkdownDepartmentModel.departmentNumber =
          department.departmentNumber;
      threeCDepartmentModel.departmentName = department.departmentName;
      threeCDepartmentModel.departmentNumber = department.departmentNumber;
      otherDepartmentModel.departmentName = department.departmentName;
      otherDepartmentModel.departmentNumber = department.departmentNumber;

      firstMarkdownDepartmentModel.currentRollup1st =
          department.categoryRollUp1StCurrentRetek;
      firstMarkdownDepartmentModel.initialRollup1st =
          department.categoryRollUp1StInitialRetek;

      threeCDepartmentModel.initialRollup3c =
          department.categoryRollUp3CInitialRetek;
      threeCDepartmentModel.currentRollup3c =
          department.categoryRollUp3CCurrentRetek;

      otherDepartmentModel.initialRollupOther =
          department.categoryRollUpOtherInitialRetek;
      otherDepartmentModel.currentRollupOther =
          department.categoryRollUpOtherCurrentRetek;

      firstMarkdownDepartmentModel.firstMarkdownFound =
          department.categoryRollUp1StFound;

      threeCDepartmentModel.threeCFound = department.categoryRollUp3CFound;

      otherDepartmentModel.otherFound = department.categoryRollUpOtherFound;

      firstMarkdownDepartmentModel.Sold1st = calcSold(
          firstMarkdownDepartmentModel.initialRollup1st,
          firstMarkdownDepartmentModel.currentRollup1st);

      threeCDepartmentModel.Sold3c = calcSold(
          threeCDepartmentModel.initialRollup3c,
          threeCDepartmentModel.currentRollup3c);

      otherDepartmentModel.SoldOther = calcSold(
          otherDepartmentModel.initialRollupOther,
          otherDepartmentModel.currentRollupOther);

      firstMarkdownDepartmentModel.outstanding1st = calculateOutstanding(
          firstMarkdownDepartmentModel.initialRollup1st,
          firstMarkdownDepartmentModel.Sold1st,
          firstMarkdownDepartmentModel.firstMarkdownFound);

      threeCDepartmentModel.outstanding3c = calculateOutstanding(
          threeCDepartmentModel.initialRollup3c,
          threeCDepartmentModel.Sold3c,
          threeCDepartmentModel.threeCFound);

      otherDepartmentModel.outstandingOther = calculateOutstanding(
          otherDepartmentModel.initialRollupOther,
          otherDepartmentModel.SoldOther,
          otherDepartmentModel.otherFound);

      //general check to see if 1st is not 0
      if (department.categoryRollUp1StInitialRetek != 0) {

        //1st and 3c
        if (department.categoryRollUp3CInitialRetek != 0 &&
            department.categoryRollUpOtherInitialRetek == 0) {
          for (Category category in department.categories) {

            //1st
            if(category.rangeRollUp1StInitialRetek!=0) {
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

              firstMarkdownDepartmentModel.firstMarkdownCategoryList
                  .add(firstMarkdownCategoryModel);
            }

            //3c
            if(category.rangeRollUp3CInitialRetek!=0) {
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
              threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
            }

            for (Range range in category.ranges) {

              //1st
              if(range.styleRollUp1StInitialRetek!=0) {
                FirstMarkupRangeModel range1st = new FirstMarkupRangeModel();
                range1st.rangeName = range.rangeName;
                range1st.rangeNumber = range.rangeNumber;
                range1st.styleRollUp1StCurrentRetek =
                    range.styleRollUp1StCurrentRetek;
                range1st.styleRollUp1StInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range1st.styleRollUp1StFound = range.styleRollUp1StFound;
                range1st.styleRollUp1StFound = calcSold(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRollUp1StCurrentRetek);
                range1st.styleRolledUp1stOutstanding = calculateOutstanding(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRolledUp1stSold,
                    range1st.styleRollUp1StFound);
                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.last.firstMarkupRangeModel
                    .add(range1st);
              }

              //c3
              if(range.styleRollUp3CInitialRetek!=0) {
                ThreeCRangeModel range3c = new ThreeCRangeModel();
                range3c.rangeName = range.rangeName;
                range3c.rangeNumber = range.rangeNumber;
                range3c.styleRollUp3CCurrentRetek =
                    range.styleRollUp3CCurrentRetek;
                range3c.styleRollUp3CInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range3c.styleRollUp3CFound = range.styleRollUp3CFound;
                range3c.styleRolledUp3CSold = calcSold(
                    range3c.styleRollUp3CInitialRetek,
                    range3c.styleRollUp3CCurrentRetek);
                range3c.styleRolledUp3cOutstanding = calculateOutstanding(
                    range3c.styleRollUp3CInitialRetek,
                    range3c.styleRolledUp3CSold,
                    range3c.styleRollUp3CFound);
                threeCDepartmentModel.threeCCategoryList.last.threeCRangeList
                    .add(range3c);
              }

              for (Style style in range.styles) {

                //1st
                if(range.styleRollUp1StInitialRetek!=0) {
                  FirstMarkupStyleModel firstStyle = new FirstMarkupStyleModel();
                  firstStyle.currentPrice = style.currentPrice;
                  firstStyle.currentRetekAmount = style.currentRetekAmount;
                  firstStyle.foundAmount = style.foundAmount;
                  firstStyle.initialPrice = style.initialPrice;
                  firstStyle.initialRetekAmount = style.initialRetekAmount;
                  firstStyle.is3C = style.is3C;
                  firstStyle.styleDescription = style.styleDescription;
                  firstStyle.styleNumber = style.styleNumber;
                  firstStyle.soldAmount = calcSold(
                      firstStyle.initialRetekAmount,
                      firstStyle.currentRetekAmount);
                  firstStyle.outstanding = calculateOutstanding(
                      firstStyle.initialRetekAmount, firstStyle.soldAmount,
                      firstStyle.foundAmount);
                  firstMarkdownDepartmentModel.firstMarkdownCategoryList.last
                      .firstMarkupRangeModel.last.firstMarkupStyleList
                      .add(firstStyle);
                }

                //3c
                if(range.styleRollUp3CInitialRetek!=0) {
                  ThreeCStyleModel threeCStyle = new ThreeCStyleModel();
                  threeCStyle.currentPrice = style.currentPrice;
                  threeCStyle.currentRetekAmount = style.currentRetekAmount;
                  threeCStyle.foundAmount = style.foundAmount;
                  threeCStyle.initialPrice = style.initialPrice;
                  threeCStyle.initialRetekAmount = style.initialRetekAmount;
                  threeCStyle.is3C = style.is3C;
                  threeCStyle.styleDescription = style.styleDescription;
                  threeCStyle.styleNumber = style.styleNumber;
                  threeCStyle.soldAmount = calcSold(
                      threeCStyle.initialRetekAmount,
                      threeCStyle.currentRetekAmount);
                  threeCStyle.outstanding = calculateOutstanding(
                      threeCStyle.initialRetekAmount, threeCStyle.soldAmount,
                      threeCStyle.foundAmount);
                  threeCDepartmentModel.threeCCategoryList.last.threeCRangeList
                      .last.threeCStyleModelList
                      .add(threeCStyle);
                }

              } //style for each

            } //ranges for each

          } //category for each

          // 1st and other
        } else if (department.categoryRollUpOtherCurrentRetek != 0 &&
            department.categoryRollUp3CInitialRetek == 0) {
          for (Category category in department.categories) {

            //1st
            if(category.rangeRollUp1StInitialRetek!=0) {
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

              firstMarkdownDepartmentModel.firstMarkdownCategoryList
                  .add(firstMarkdownCategoryModel);
            }

            //other
            if(category.rangeRollUpOtherInitialRetek!=0) {
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

              otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
            }

            for (Range range in category.ranges) {

              //1st
              if(range.styleRollUp1StInitialRetek!=0) {
                FirstMarkupRangeModel range1st = new FirstMarkupRangeModel();
                range1st.rangeName = range.rangeName;
                range1st.rangeNumber = range.rangeNumber;
                range1st.styleRollUp1StCurrentRetek =
                    range.styleRollUp1StCurrentRetek;
                range1st.styleRollUp1StInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range1st.styleRollUp1StFound = range.styleRollUp1StFound;
                range1st.styleRollUp1StFound = calcSold(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRollUp1StCurrentRetek);
                range1st.styleRolledUp1stOutstanding = calculateOutstanding(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRolledUp1stSold,
                    range1st.styleRollUp1StFound);
                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.last.firstMarkupRangeModel
                    .add(range1st);
              }

              //other
              if(range.styleRollUpOtherInitialRetek!=0) {
                OtherRangeModel rangeOther = new OtherRangeModel();
                rangeOther.rangeName = range.rangeName;
                rangeOther.rangeNumber = range.rangeNumber;
                rangeOther.styleRollUpOtherCurrentRetek =
                    range.styleRollUpOtherCurrentRetek;
                rangeOther.styleRollUpOtherInitialRetek =
                    range.styleRollUpOtherInitialRetek;
                rangeOther.styleRollUpOtherFound = range.styleRollUpOtherFound;
                rangeOther.styleRolledUpOtherSold = calcSold(
                    rangeOther.styleRollUpOtherInitialRetek,
                    rangeOther.styleRollUpOtherCurrentRetek);
                rangeOther.styleRolledUpOtherOutstanding = calculateOutstanding(
                    rangeOther.styleRollUpOtherInitialRetek,
                    rangeOther.styleRolledUpOtherSold,
                    rangeOther.styleRollUpOtherFound);
                otherDepartmentModel.otherCategoryList.last.otherRangeModel
                    .add(rangeOther);
              }

              for (Style style in range.styles) {
                //1st
                if(range.styleRollUp1StInitialRetek!=0) {
                  FirstMarkupStyleModel firstStyle = new FirstMarkupStyleModel();
                  firstStyle.currentPrice = style.currentPrice;
                  firstStyle.currentRetekAmount = style.currentRetekAmount;
                  firstStyle.foundAmount = style.foundAmount;
                  firstStyle.initialPrice = style.initialPrice;
                  firstStyle.initialRetekAmount = style.initialRetekAmount;
                  firstStyle.is3C = style.is3C;
                  firstStyle.styleDescription = style.styleDescription;
                  firstStyle.styleNumber = style.styleNumber;
                  firstStyle.soldAmount = calcSold(
                      firstStyle.initialRetekAmount,
                      firstStyle.currentRetekAmount);
                  firstStyle.outstanding = calculateOutstanding(
                      firstStyle.initialRetekAmount, firstStyle.soldAmount,
                      firstStyle.foundAmount);
                  firstMarkdownDepartmentModel.firstMarkdownCategoryList.last
                      .firstMarkupRangeModel.last.firstMarkupStyleList
                      .add(firstStyle);

                }
                //other
                if(range.styleRollUpOtherInitialRetek!=0){
                  OtherStyleModel otherStyle = new OtherStyleModel();
                  otherStyle.currentPrice = style.currentPrice;
                  otherStyle.currentRetekAmount = style.currentRetekAmount;
                  otherStyle.foundAmount = style.foundAmount;
                  otherStyle.initialPrice = style.initialPrice;
                  otherStyle.initialRetekAmount = style.initialRetekAmount;
                  otherStyle.is3C = style.is3C;
                  otherStyle.styleDescription = style.styleDescription;
                  otherStyle.styleNumber = style.styleNumber;
                  otherStyle.soldAmount = calcSold(
                      otherStyle.initialRetekAmount,
                      otherStyle.currentRetekAmount);
                  otherStyle.outstanding = calculateOutstanding(
                      otherStyle.initialRetekAmount, otherStyle.soldAmount,
                      otherStyle.foundAmount);
                  otherDepartmentModel.otherCategoryList.last.otherRangeModel
                      .last.otherStyleModelList
                      .add(otherStyle);
                }
              } //style for each

            } //ranges for each

          } //category for each

          //1st only
        } else if (department.categoryRollUp3CInitialRetek == 0 &&
            department.categoryRollUpOtherInitialRetek == 0) {
          for (Category category in department.categories) {

            //1st
            if(category.rangeRollUp1StInitialRetek!=0) {
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

              firstMarkdownDepartmentModel.firstMarkdownCategoryList
                  .add(firstMarkdownCategoryModel);
            }

            for (Range range in category.ranges) {

              //1st range
              if(range.styleRollUp1StInitialRetek!=0) {
                FirstMarkupRangeModel range1st = new FirstMarkupRangeModel();
                range1st.rangeName = range.rangeName;
                range1st.rangeNumber = range.rangeNumber;
                range1st.styleRollUp1StCurrentRetek =
                    range.styleRollUp1StCurrentRetek;
                range1st.styleRollUp1StInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range1st.styleRollUp1StFound = range.styleRollUp1StFound;
                range1st.styleRollUp1StFound = calcSold(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRollUp1StCurrentRetek);
                range1st.styleRolledUp1stOutstanding = calculateOutstanding(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRolledUp1stSold,
                    range1st.styleRollUp1StFound);
                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.last.firstMarkupRangeModel
                    .add(range1st);
              }

              for (Style style in range.styles) {

                //1st style
                if(range.styleRollUp1StInitialRetek!=0) {
                  FirstMarkupStyleModel firstStyle = new FirstMarkupStyleModel();
                  firstStyle.currentPrice = style.currentPrice;
                  firstStyle.currentRetekAmount = style.currentRetekAmount;
                  firstStyle.foundAmount = style.foundAmount;
                  firstStyle.initialPrice = style.initialPrice;
                  firstStyle.initialRetekAmount = style.initialRetekAmount;
                  firstStyle.is3C = style.is3C;
                  firstStyle.styleDescription = style.styleDescription;
                  firstStyle.styleNumber = style.styleNumber;
                  firstStyle.soldAmount = calcSold(
                      firstStyle.initialRetekAmount,
                      firstStyle.currentRetekAmount);
                  firstStyle.outstanding = calculateOutstanding(
                      firstStyle.initialRetekAmount, firstStyle.soldAmount,
                      firstStyle.foundAmount);

                  firstMarkdownDepartmentModel.firstMarkdownCategoryList.last
                      .firstMarkupRangeModel.last.firstMarkupStyleList
                      .add(firstStyle);
                }
              } //style for each

            } //ranges for each

          } //category for each

          //1st,3c and other
        } else if (department.categoryRollUp3CInitialRetek != 0 &&
            department.categoryRollUpOtherInitialRetek != 0) {
          for (Category category in department.categories) {

            //1st
            if(category.rangeRollUp1StInitialRetek!=0) {
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

              firstMarkdownDepartmentModel.firstMarkdownCategoryList
                  .add(firstMarkdownCategoryModel);
            }

            //3c
            if(category.rangeRollUp3CInitialRetek!=0) {
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
              threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
            }

            //other
            if(category.rangeRollUpOtherInitialRetek!=0) {
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
              otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
            }

            for (Range range in category.ranges) {

              //1st range
              if(range.styleRollUp1StInitialRetek!=0) {
                FirstMarkupRangeModel range1st = new FirstMarkupRangeModel();
                range1st.rangeName = range.rangeName;
                range1st.rangeNumber = range.rangeNumber;
                range1st.styleRollUp1StCurrentRetek =
                    range.styleRollUp1StCurrentRetek;
                range1st.styleRollUp1StInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range1st.styleRollUp1StFound = range.styleRollUp1StFound;
                range1st.styleRollUp1StFound = calcSold(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRollUp1StCurrentRetek);
                range1st.styleRolledUp1stOutstanding = calculateOutstanding(
                    range1st.styleRollUp1StInitialRetek,
                    range1st.styleRolledUp1stSold,
                    range1st.styleRollUp1StFound);
                firstMarkdownDepartmentModel
                    .firstMarkdownCategoryList.last.firstMarkupRangeModel
                    .add(range1st);
              }

              //other range
              if(range.styleRollUpOtherInitialRetek!=0) {
                OtherRangeModel rangeOther = new OtherRangeModel();
                rangeOther.rangeName = range.rangeName;
                rangeOther.rangeNumber = range.rangeNumber;
                rangeOther.styleRollUpOtherCurrentRetek =
                    range.styleRollUpOtherCurrentRetek;
                rangeOther.styleRollUpOtherInitialRetek =
                    range.styleRollUpOtherInitialRetek;
                rangeOther.styleRollUpOtherFound = range.styleRollUpOtherFound;
                rangeOther.styleRolledUpOtherSold = calcSold(
                    rangeOther.styleRollUpOtherInitialRetek,
                    rangeOther.styleRollUpOtherCurrentRetek);
                rangeOther.styleRolledUpOtherOutstanding = calculateOutstanding(
                    rangeOther.styleRollUpOtherInitialRetek,
                    rangeOther.styleRolledUpOtherSold,
                    rangeOther.styleRollUpOtherFound);
                otherDepartmentModel.otherCategoryList.last.otherRangeModel
                    .add(rangeOther);
              }

              //threec range
              if(range.styleRollUp3CInitialRetek!=0) {
                ThreeCRangeModel range3c = new ThreeCRangeModel();
                range3c.rangeName = range.rangeName;
                range3c.rangeNumber = range.rangeNumber;
                range3c.styleRollUp3CCurrentRetek =
                    range.styleRollUp3CCurrentRetek;
                range3c.styleRollUp3CInitialRetek =
                    range.styleRollUp1StInitialRetek;
                range3c.styleRollUp3CFound = range.styleRollUp3CFound;
                range3c.styleRolledUp3CSold = calcSold(
                    range3c.styleRollUp3CInitialRetek,
                    range3c.styleRollUp3CCurrentRetek);
                range3c.styleRolledUp3cOutstanding = calculateOutstanding(
                    range3c.styleRollUp3CInitialRetek,
                    range3c.styleRolledUp3CSold,
                    range3c.styleRollUp3CFound);
                threeCDepartmentModel.threeCCategoryList.last.threeCRangeList
                    .add(range3c);
              }

              for (Style style in range.styles) {

                if(style.initialRetekAmount!=0) {

                  //1st style
                  if(range.styleRollUp1StInitialRetek!=0) {
                    FirstMarkupStyleModel firstStyle = new FirstMarkupStyleModel();
                    firstStyle.currentPrice = style.currentPrice;
                    firstStyle.currentRetekAmount = style.currentRetekAmount;
                    firstStyle.foundAmount = style.foundAmount;
                    firstStyle.initialPrice = style.initialPrice;
                    firstStyle.initialRetekAmount = style.initialRetekAmount;
                    firstStyle.is3C = style.is3C;
                    firstStyle.styleDescription = style.styleDescription;
                    firstStyle.styleNumber = style.styleNumber;
                    firstStyle.soldAmount = calcSold(
                        firstStyle.initialRetekAmount,
                        firstStyle.currentRetekAmount);
                    firstStyle.outstanding = calculateOutstanding(
                        firstStyle.initialRetekAmount, firstStyle.soldAmount,
                        firstStyle.foundAmount);
                    firstMarkdownDepartmentModel.firstMarkdownCategoryList.last
                        .firstMarkupRangeModel.last.firstMarkupStyleList
                        .add(firstStyle);
                  }

                  //3c style
                  if(range.styleRollUp3CInitialRetek!=0) {
                    ThreeCStyleModel threeCStyle = new ThreeCStyleModel();
                    threeCStyle.currentPrice = style.currentPrice;
                    threeCStyle.currentRetekAmount = style.currentRetekAmount;
                    threeCStyle.foundAmount = style.foundAmount;
                    threeCStyle.initialPrice = style.initialPrice;
                    threeCStyle.initialRetekAmount = style.initialRetekAmount;
                    threeCStyle.is3C = style.is3C;
                    threeCStyle.styleDescription = style.styleDescription;
                    threeCStyle.styleNumber = style.styleNumber;
                    threeCStyle.soldAmount = calcSold(
                        threeCStyle.initialRetekAmount,
                        threeCStyle.currentRetekAmount);
                    threeCStyle.outstanding = calculateOutstanding(
                        threeCStyle.initialRetekAmount, threeCStyle.soldAmount,
                        threeCStyle.foundAmount);
                    threeCDepartmentModel.threeCCategoryList.last
                        .threeCRangeList
                        .last.threeCStyleModelList
                        .add(threeCStyle);
                  }

                  //other style
                  if(range.styleRollUpOtherInitialRetek!=0) {
                    OtherStyleModel otherStyle = new OtherStyleModel();
                    otherStyle.currentPrice = style.currentPrice;
                    otherStyle.currentRetekAmount = style.currentRetekAmount;
                    otherStyle.foundAmount = style.foundAmount;
                    otherStyle.initialPrice = style.initialPrice;
                    otherStyle.initialRetekAmount = style.initialRetekAmount;
                    otherStyle.is3C = style.is3C;
                    otherStyle.styleDescription = style.styleDescription;
                    otherStyle.styleNumber = style.styleNumber;
                    otherStyle.soldAmount = calcSold(
                        otherStyle.initialRetekAmount,
                        otherStyle.currentRetekAmount);
                    otherStyle.outstanding = calculateOutstanding(
                        otherStyle.initialRetekAmount, otherStyle.soldAmount,
                        otherStyle.foundAmount);
                    otherDepartmentModel.otherCategoryList.last.otherRangeModel
                        .last.otherStyleModelList
                        .add(otherStyle);
                  }
                }
              } //style for each

            } //ranges for each

          } //category for each
        }

        //other only
      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUpOtherInitialRetek != 0 &&
          department.categoryRollUp3CInitialRetek == 0) {
        for (Category category in department.categories) {

          //other
          if(category.rangeRollUpOtherInitialRetek!=0) {
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

            otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
          }

          for (Range range in category.ranges) {
            OtherRangeModel rangeOther = new OtherRangeModel();

            //other range
            if(range.styleRollUpOtherInitialRetek!=0) {
              rangeOther.rangeName = range.rangeName;
              rangeOther.rangeNumber = range.rangeNumber;
              rangeOther.styleRollUpOtherCurrentRetek =
                  range.styleRollUpOtherCurrentRetek;
              rangeOther.styleRollUpOtherInitialRetek =
                  range.styleRollUpOtherInitialRetek;
              rangeOther.styleRollUpOtherFound = range.styleRollUpOtherFound;
              rangeOther.styleRolledUpOtherSold = calcSold(
                  rangeOther.styleRollUpOtherInitialRetek,
                  rangeOther.styleRollUpOtherCurrentRetek);
              rangeOther.styleRolledUpOtherOutstanding = calculateOutstanding(
                  rangeOther.styleRollUpOtherInitialRetek,
                  rangeOther.styleRolledUpOtherSold,
                  rangeOther.styleRollUpOtherFound);

              otherDepartmentModel.otherCategoryList.last.otherRangeModel
                  .add(rangeOther);
            }

            for (Style style in range.styles) {

              //other style
              if(range.styleRollUpOtherInitialRetek!=0) {
                OtherStyleModel otherStyle = new OtherStyleModel();
                otherStyle.currentPrice = style.currentPrice;
                otherStyle.currentRetekAmount = style.currentRetekAmount;
                otherStyle.foundAmount = style.foundAmount;
                otherStyle.initialPrice = style.initialPrice;
                otherStyle.initialRetekAmount = style.initialRetekAmount;
                otherStyle.is3C = style.is3C;
                otherStyle.styleDescription = style.styleDescription;
                otherStyle.styleNumber = style.styleNumber;
                otherStyle.soldAmount = calcSold(
                    otherStyle.initialRetekAmount,
                    otherStyle.currentRetekAmount);
                otherStyle.outstanding = calculateOutstanding(
                    otherStyle.initialRetekAmount, otherStyle.soldAmount,
                    otherStyle.foundAmount);
                otherDepartmentModel.otherCategoryList.last.otherRangeModel
                    .last.otherStyleModelList
                    .add(otherStyle);
              }
            } //style for each

          } //ranges for each

        } //category for each

        //3c only
      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUp3CInitialRetek != 0 &&
          department.categoryRollUpOtherInitialRetek == 0) {
        for (Category category in department.categories) {

          //3c
          if(category.rangeRollUp3CInitialRetek!=0) {
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
            threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
          }


          for (Range range in category.ranges) {

            //threec range
            if(range.styleRollUp3CInitialRetek!=0) {
              ThreeCRangeModel range3c = new ThreeCRangeModel();
              range3c.rangeName = range.rangeName;
              range3c.rangeNumber = range.rangeNumber;
              range3c.styleRollUp3CCurrentRetek =
                  range.styleRollUp3CCurrentRetek;
              range3c.styleRollUp3CInitialRetek =
                  range.styleRollUp1StInitialRetek;
              range3c.styleRollUp3CFound = range.styleRollUp3CFound;
              range3c.styleRolledUp3CSold = calcSold(
                  range3c.styleRollUp3CInitialRetek,
                  range3c.styleRollUp3CCurrentRetek);
              range3c.styleRolledUp3cOutstanding = calculateOutstanding(
                  range3c.styleRollUp3CInitialRetek,
                  range3c.styleRolledUp3CSold,
                  range3c.styleRollUp3CFound);
              threeCDepartmentModel.threeCCategoryList.last.threeCRangeList
                  .add(range3c);
            }

            for (Style style in range.styles) {

              //3c style
              if(range.styleRollUp3CInitialRetek!=0) {
                ThreeCStyleModel threeCStyle = new ThreeCStyleModel();
                threeCStyle.currentPrice = style.currentPrice;
                threeCStyle.currentRetekAmount = style.currentRetekAmount;
                threeCStyle.foundAmount = style.foundAmount;
                threeCStyle.initialPrice = style.initialPrice;
                threeCStyle.initialRetekAmount = style.initialRetekAmount;
                threeCStyle.is3C = style.is3C;
                threeCStyle.styleDescription = style.styleDescription;
                threeCStyle.styleNumber = style.styleNumber;
                threeCStyle.soldAmount = calcSold(
                    threeCStyle.initialRetekAmount,
                    threeCStyle.currentRetekAmount);
                threeCStyle.outstanding = calculateOutstanding(
                    threeCStyle.initialRetekAmount, threeCStyle.soldAmount,
                    threeCStyle.foundAmount);
                threeCDepartmentModel.threeCCategoryList.last.threeCRangeList
                    .last.threeCStyleModelList
                    .add(threeCStyle);
              }

            } //style for each

          } //ranges for each

        } //category for each

        //3c and other
      } else if (department.categoryRollUp1StInitialRetek == 0 &&
          department.categoryRollUp3CInitialRetek != 0 &&
          department.categoryRollUpOtherInitialRetek != 0) {
        for (Category category in department.categories) {

          //3c
          if(category.rangeRollUp3CInitialRetek!=0) {
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
            threeCDepartmentModel.threeCCategoryList.add(threeCCategoryModel);
          }

          //other
          if(category.rangeRollUpOtherInitialRetek!=0) {
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
            otherDepartmentModel.otherCategoryList.add(otherCategoryModel);
          }


          for (Range range in category.ranges) {

            //threec range
            if(range.styleRollUp3CInitialRetek!=0) {
              ThreeCRangeModel range3c = new ThreeCRangeModel();
              range3c.rangeName = range.rangeName;
              range3c.rangeNumber = range.rangeNumber;
              range3c.styleRollUp3CCurrentRetek =
                  range.styleRollUp3CCurrentRetek;
              range3c.styleRollUp3CInitialRetek =
                  range.styleRollUp1StInitialRetek;
              range3c.styleRollUp3CFound = range.styleRollUp3CFound;
              range3c.styleRolledUp3CSold = calcSold(
                  range3c.styleRollUp3CInitialRetek,
                  range3c.styleRollUp3CCurrentRetek);
              range3c.styleRolledUp3cOutstanding = calculateOutstanding(
                  range3c.styleRollUp3CInitialRetek,
                  range3c.styleRolledUp3CSold,
                  range3c.styleRollUp3CFound);
              threeCDepartmentModel.threeCCategoryList.first.threeCRangeList
                  .add(range3c);
            }

            //other range
            if(range.styleRollUpOtherInitialRetek!=0) {
              OtherRangeModel rangeOther = new OtherRangeModel();
              rangeOther.rangeName = range.rangeName;
              rangeOther.rangeNumber = range.rangeNumber;
              rangeOther.styleRollUpOtherCurrentRetek =
                  range.styleRollUpOtherCurrentRetek;
              rangeOther.styleRollUpOtherInitialRetek =
                  range.styleRollUpOtherInitialRetek;
              rangeOther.styleRollUpOtherFound = range.styleRollUpOtherFound;
              rangeOther.styleRolledUpOtherSold = calcSold(
                  rangeOther.styleRollUpOtherInitialRetek,
                  rangeOther.styleRollUpOtherCurrentRetek);
              rangeOther.styleRolledUpOtherOutstanding = calculateOutstanding(
                  rangeOther.styleRollUpOtherInitialRetek,
                  rangeOther.styleRolledUpOtherSold,
                  rangeOther.styleRollUpOtherFound);
              otherDepartmentModel.otherCategoryList.first.otherRangeModel
                  .add(rangeOther);
            }

            for (Style style in range.styles) {

              //3c style
              if(range.styleRollUp3CInitialRetek!=0) {
                ThreeCStyleModel threeCStyle = new ThreeCStyleModel();
                threeCStyle.currentPrice = style.currentPrice;
                threeCStyle.currentRetekAmount = style.currentRetekAmount;
                threeCStyle.foundAmount = style.foundAmount;
                threeCStyle.initialPrice = style.initialPrice;
                threeCStyle.initialRetekAmount = style.initialRetekAmount;
                threeCStyle.is3C = style.is3C;
                threeCStyle.styleDescription = style.styleDescription;
                threeCStyle.styleNumber = style.styleNumber;
                threeCStyle.soldAmount = calcSold(
                    threeCStyle.initialRetekAmount,
                    threeCStyle.currentRetekAmount);
                threeCStyle.outstanding = calculateOutstanding(
                    threeCStyle.initialRetekAmount, threeCStyle.soldAmount,
                    threeCStyle.foundAmount);
                threeCDepartmentModel.threeCCategoryList.first.threeCRangeList
                    .first.threeCStyleModelList
                    .add(threeCStyle);
              }

              //other style
              if(range.styleRollUpOtherInitialRetek!=0){
                OtherStyleModel otherStyle = new OtherStyleModel();
                otherStyle.currentPrice = style.currentPrice;
                otherStyle.currentRetekAmount = style.currentRetekAmount;
                otherStyle.foundAmount = style.foundAmount;
                otherStyle.initialPrice = style.initialPrice;
                otherStyle.initialRetekAmount = style.initialRetekAmount;
                otherStyle.is3C = style.is3C;
                otherStyle.styleDescription = style.styleDescription;
                otherStyle.styleNumber = style.styleNumber;
                otherStyle.soldAmount =
                    calcSold(otherStyle.initialRetekAmount,
                        otherStyle.currentRetekAmount);
                otherStyle.outstanding = calculateOutstanding(
                    otherStyle.initialRetekAmount, otherStyle.soldAmount,
                    otherStyle.foundAmount);
                otherDepartmentModel.otherCategoryList.first.otherRangeModel
                    .first
                    .otherStyleModelList
                    .add(otherStyle);
              }
            } //style for each

          } //ranges for each

        } //category for each

      }

      this._listOfDepartments.add(departmentModelObj);

      //todo : do checks on department values, if all zero do not add to lists

      if (firstMarkdownDepartmentModel.currentRollup1st != 0 ||
          firstMarkdownDepartmentModel.initialRollup1st != 0) {
        this
            ._firstMarkdownDepratmentModelList
            .add(firstMarkdownDepartmentModel);
      }
      if (threeCDepartmentModel.currentRollup3c != 0 ||
          threeCDepartmentModel.initialRollup3c != 0) {
        this._threeCDepartmentModel.add(threeCDepartmentModel);
      }
      if (otherDepartmentModel.currentRollupOther != 0 ||
          otherDepartmentModel.initialRollupOther != 0) {
        this._otherDepartmentModel.add(otherDepartmentModel);
      }
    } //department for each
//    this._firstMarkdownCategoryList = _firstMarkdownCategoryList;
//    this._otherCategoryList = _otherCategoryList;
//    this._threeCCategoryList = _threeCCategoryList;
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

  List<OtherDepartmentModel> get otherDepartmentModel => _otherDepartmentModel;

  set otherDepartmentModel(List<OtherDepartmentModel> value) {
    _otherDepartmentModel = value;
  }

  List<ThreeCDepartmentModel> get threeCDepartmentModel =>
      _threeCDepartmentModel;

  set threeCDepartmentModel(List<ThreeCDepartmentModel> value) {
    _threeCDepartmentModel = value;
  }

  List<FirstMarkdownDepartmentModel> get firstMarkdownDepratmentModelList =>
      _firstMarkdownDepratmentModelList;

  set firstMarkdownDepratmentModelList(
      List<FirstMarkdownDepartmentModel> value) {
    _firstMarkdownDepratmentModelList = value;
  }

  List<OtherStyleModel> get otherStyleList => _otherStyleList;

  set otherStyleList(List<OtherStyleModel> value) {
    _otherStyleList = value;
  }

  List<OtherRangeModel> get otherRangeList => _otherRangeList;

  set otherRangeList(List<OtherRangeModel> value) {
    _otherRangeList = value;
  }

  List<ThreeCStyleModel> get threeCStyleList => _threeCStyleList;

  set threeCStyleList(List<ThreeCStyleModel> value) {
    _threeCStyleList = value;
  }

  List<ThreeCRangeModel> get threeCRangeList => _threeCRangeList;

  set threeCRangeList(List<ThreeCRangeModel> value) {
    _threeCRangeList = value;
  }

  List<FirstMarkupStyleModel> get firstStyleList => _firstStyleList;

  set firstStyleList(List<FirstMarkupStyleModel> value) {
    _firstStyleList = value;
  }

  List<FirstMarkupRangeModel> get firstRangeList => _firstRangeList;

  set firstRangeList(List<FirstMarkupRangeModel> value) {
    _firstRangeList = value;
  }
}
