import 'package:flutter/material.dart';
import 'package:markdowns/models/testModel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';
import 'package:markdowns/models/threeccategorymodel.dart';
import 'package:markdowns/models/OtherCategoryModel.dart';
import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/markdownstylemodel.dart';
import 'package:markdowns/models/populateHierarchyModel.dart';
import "package:collection/collection.dart";
import 'package:flutter/foundation.dart';
import 'package:markdowns/models/firstmarkdowndepartmentmodel.dart';
import 'package:markdowns/models/otherdepartmentmodel.dart';
import 'package:markdowns/models/threecdepartmentmodel.dart';

class MainHierarchy extends StatelessWidget {
//  final List<TestModel> products;
  final DepartmentModel departmentModel;

  String _selection = "";

  // Post postModel;

  Map<String, String> details = {
    'Description': '',
    'Rollup': '',
    'Found': '',
    'Outstanding': '',
    'Sold': ''
  };

  String subTitle = "";
  int ListCount;

  List<FirstMarkdownDepartmentModel> firstDeptList = new List()
  List<ThreeCDepartmentModel> threeDeptList = new List();
  List<OtherDepartmentModel> otherDeptList = new List();
  List<FirstMarkdownCategoryModel> firstMarkupList = new List();
  List<ThreeCCategoryModel> threeList = new List();
  List<DepartmentModel> deptList = new List();
  List<OtherCategoryModel> otherList = new List();
  List<MarkdownRangeModel> firstRangeList = new List();
  List<MarkdownRangeModel> threeRangeList = new List();
  List<MarkdownRangeModel> otherRangeList = new List();



  //populates array with array past into constructor
  MainHierarchy(this.departmentModel, this._selection);

  //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }

  Widget _buildProductItem(BuildContext context, int index) {
    switch (_selection) {
      case 'Dept1st':
        details['Description'] = deptList[index].departmentNumber +
            " " +
            deptList[index].departmentName;
        details['Rollup'] = deptList[index].currentRollup1st.toString();
        details['Found'] = deptList[index].firstMarkdownFound.toString();
        details['Outstanding'] = deptList[index].outstanding1st.toString();
        details['Sold'] = deptList[index].Sold1st.toString()+"?";
        break;
      case 'Dept3c':
        details['Description'] = deptList[index].departmentNumber +
            " " +
            deptList[index].departmentName;
        details['Rollup'] = deptList[index].currentRollup3c.toString();
        details['Found'] = deptList[index].threeCFound.toString();
        details['Outstanding'] = deptList[index].outstanding3c.toString();
        details['Sold'] = deptList[index].Sold3c.toString();
        break;
      case 'DeptOther':
        details['Description'] = deptList[index].departmentNumber +
            " " +
            deptList[index].departmentName;
        details['Rollup'] = deptList[index].currentRollupOther.toString();
        details['Found'] = deptList[index].otherFound.toString();
        details['Outstanding'] = deptList[index].outstandingOther.toString();
        details['Sold'] = deptList[index].SoldOther.toString();
        break;
      case 'Categry1st':
        details['Description'] = firstMarkupList[index].categoryNumber+" "+firstMarkupList[index].categoryName;
        details['Rollup'] = firstMarkupList[index].rangeRollUp1stCurrentRetek.toString();
        details['Found'] = firstMarkupList[index].rangeRollUp1stFound.toString();
        details['Outstanding'] = firstMarkupList[index].rangeRollUp1stOutstanding.toString();
        details['Sold'] = firstMarkupList[index].rangeRolledUp1stSold.toString()+"?";
        break;
      case 'Categry3c':
        details['Description'] = threeList[index].categoryNumber+" "+ threeList[index].categoryName;
        details['Rollup'] = threeList[index].rangeRollUp3cCurrentRetek.toString();
        details['Found'] = threeList[index].rangeRollUp3cFound.toString();
        details['Outstanding'] = threeList[index].rangeRolledUp3cOutstanding.toString();
        details['Sold'] = threeList[index].rangeRolledUpc3Sold.toString()+"?";
        print("Categry3c case shown");
        break;
      case 'CategryOther':
        details['Description'] = otherList[index].categoryNumber+" "+otherList[index].categoryName;
        details['Rollup'] = otherList[index].rangeRollOtherCurrentRetek.toString();
        details['Found'] = otherList[index].rangeRollUpOtherFound.toString();
        details['Outstanding'] = otherList[index].rangeRolledOtherOutstanding.toString();
        details['Sold'] = otherList[index].rangeRolledUpOtherSold.toString()+"?";
        print("CategryOther case shown");
        break;
      case 'Range1st':
        details['Description'] = firstRangeList[index].rangeNumber+" "+firstRangeList[index].rangeName;
        details['Rollup'] = firstRangeList[index].styleRollUp1StCurrentRetek.toString();
        details['Found'] = firstRangeList[index].styleRollUp1StFound.toString();
        details['Outstanding'] = firstRangeList[index].styleRolledUp1stOutstanding.toString();
        details['Sold'] = firstRangeList[index].styleRolledUp1stSold.toString()+"?";
        print("Range1st case shown");
        break;
      case 'Range3c':
        details['Description'] = threeRangeList[index].rangeNumber+" "+threeRangeList[index].rangeName;
        details['Rollup'] = threeRangeList[index].styleRollUp3CCurrentRetek.toString();
        details['Found'] = threeRangeList[index].styleRollUp3CFound.toString();
        details['Outstanding'] = threeRangeList[index].styleRolledUp3cOutstanding.toString();
        details['Sold'] = threeRangeList[index].styleRolledUp3CSold.toString()+"?";
        print("Range3c case shown");
        break;
      case 'RangeOther':
        details['Description'] = otherRangeList[index].rangeNumber+" "+otherRangeList[index].rangeName;
        details['Rollup'] = otherRangeList[index].styleRollUpOtherCurrentRetek.toString();
        details['Found'] = otherRangeList[index].styleRollUpOtherFound.toString();
        details['Outstanding'] = otherRangeList[index].styleRolledUpOtherOutstanding.toString();
        details['Sold'] = otherRangeList[index].styleRolledUpOtherSold.toString()+"?";
        print("RangeOther case shown");
        break;
      default:
        print("default case shown");
        break;
    }

    return Card(
        child: Container(
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blueAccent, width: 2)),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(details['Description'],
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
              )),
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: Text(details['Rollup'],
                    style: TextStyle(
                      fontSize: 16.0,
                    )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10.0, top: 5.0, left: 5.0),
//                      padding: const EdgeInsets.only(
//                       top: 0.0, right: 0.0, bottom: 10.0, left: 0.0),
                      decoration: new BoxDecoration(
                          border: Border(
                        top: new BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                            style: BorderStyle.solid),
                        bottom: new BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                            style: BorderStyle.solid),
                        left: new BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                            style: BorderStyle.solid),
                      )),
                      child: Text(
                        details['Found'],
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(bottom: 10.0, top: 5.0),
                //padding: const EdgeInsets.only(
                // top: 10.0, right: 0.0, bottom: 10.0, left: 10.0),
                decoration: new BoxDecoration(
                    border: Border(
                  top: new BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                      style: BorderStyle.solid),
                  bottom: new BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                      style: BorderStyle.solid),
                )),
                child: Text(
                  details['Outstanding'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10.0, top: 5.0, right: 5.0),
                      //padding: const EdgeInsets.only(
                      // top: 10.0, right: 0.0, bottom: 10.0, left: 10.0),
                      decoration: new BoxDecoration(
                          border: new Border.all(
                              color: Colors.blueAccent, width: 2)),
                      child: Text(
                        details['Sold'],
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {

    //populate department list
    var generalList = departmentModel.listOfDepartments;

    deptList = generalList;


    //populate department lists
    firstDeptList = PopulateHierarchyModel.getDeptFirstList(departmentModel);
    threeDeptList = PopulateHierarchyModel.getDeptThreeList(departmentModel);
    otherDeptList = PopulateHierarchyModel.getDeptOtherList(departmentModel);

    //populate catagory Lists
    firstMarkupList = PopulateHierarchyModel.getCatalogFirstList(departmentModel);
    threeList = PopulateHierarchyModel.getCatalogThreeList(departmentModel);
    otherList = PopulateHierarchyModel.getCatalogOtherList(departmentModel);

    //populate range lists
    firstRangeList = PopulateHierarchyModel.getRangeModelFirstList(departmentModel);
    threeRangeList = PopulateHierarchyModel.getThreeRangeList(departmentModel);
    otherRangeList = PopulateHierarchyModel.getOtherRangeList(departmentModel);

    switch(_selection){
      case 'Dept1st':
        ListCount = firstDeptList.length;
        break;
      case 'Dept3c':
        ListCount = threeDeptList.length;
        break;
      case 'DeptOther':
        ListCount = otherDeptList.length;
        break;
      case 'Categry1st':
        ListCount = firstMarkupList.length;
        break;
      case 'Categry3c':
        ListCount = threeList.length;
        break;
      case 'CategryOther':
        ListCount = otherList.length;
        break;
      case'Range1st':
        ListCount = firstRangeList.length;
        break;
      case 'Range3c':
        ListCount = threeRangeList.length;
        break;
      case 'RangeOther':
        ListCount = otherRangeList.length;
        break;
      default :  ListCount = 0;
    }

    return Scaffold(
      appBar: AppBar(title: Text(subTitle, textAlign: TextAlign.center)),
      body: ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: ListCount,
      ),
    );
  }
}
