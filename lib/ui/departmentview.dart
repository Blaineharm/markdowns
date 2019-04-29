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
import 'package:markdowns/models/firstmarkuprangemodel.dart';
import 'package:markdowns/models/firstmarkupstylemodel.dart';
import 'package:markdowns/models/threecrangemodel.dart';
import 'package:markdowns/models/threecstylemodel.dart';
import 'package:markdowns/models/otherrangemodel.dart';
import 'package:markdowns/models/otherstylemodel.dart';
import 'package:markdowns/ui/catagoryView.dart';

class DepartmentView extends StatelessWidget {
//  final List<TestModel> products;
  final DepartmentModel departmentModel;
  String _selection = "";
  int selectionId = 0;
  List<dynamic> selectionList = new List();

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

  List<FirstMarkdownDepartmentModel> firstDeptList = new List();
  List<ThreeCDepartmentModel> threeDeptList = new List();
  List<OtherDepartmentModel> otherDeptList = new List();
  List<FirstMarkdownCategoryModel> firstMarkupList = new List();
  List<ThreeCCategoryModel> threeList = new List();
  List<DepartmentModel> deptList = new List();
  List<OtherCategoryModel> otherList = new List();
  List<FirstMarkupRangeModel> firstRangeList = new List();
  List<ThreeCRangeModel> threeRangeList = new List();
  List<OtherRangeModel> otherRangeList = new List();
  List<FirstMarkupStyleModel> firstStyleList = new List();
  List<ThreeCStyleModel> threeStyleList = new List();
  List<OtherStyleModel> otherStyleList = new List();

  //passes department model and selection from hierarchyDrill class
  DepartmentView(this.departmentModel, this._selection);

  //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }

  Widget _buildProductItem(BuildContext context, int index) {

    switch (_selection) {
      case '1st':
        details['Description'] = firstDeptList[index].departmentNumber +
            " " +
            firstDeptList[index].departmentName;
        details['Rollup'] = firstDeptList[index].currentRollup1st.toString();
        details['Found'] = firstDeptList[index].firstMarkdownFound.toString();
        details['Outstanding'] = firstDeptList[index].outstanding1st.toString();
        details['Sold'] = firstDeptList[index].Sold1st.toString() + "?";
        selectionList.add(firstDeptList[index]);
        break;
      case '3c':
        details['Description'] = threeDeptList[index].departmentNumber +
            " " +
            threeDeptList[index].departmentName;
        details['Rollup'] = threeDeptList[index].currentRollup3c.toString();
        details['Found'] = threeDeptList[index].threeCFound.toString();
        details['Outstanding'] = threeDeptList[index].outstanding3c.toString();
        details['Sold'] = threeDeptList[index].Sold3c.toString();
        selectionList.add(threeDeptList[index]);
        break;
      case 'Other':
        details['Description'] = otherDeptList[index].departmentNumber +
            " " +
            otherDeptList[index].departmentName;
        details['Rollup'] = otherDeptList[index].currentRollupOther.toString();
        details['Found'] = otherDeptList[index].otherFound.toString();
        details['Outstanding'] =
            otherDeptList[index].outstandingOther.toString();
        details['Sold'] = otherDeptList[index].SoldOther.toString();
        selectionList.add(otherDeptList[index]);
        break;
      default:
        //todo :  Initialize details map to empty values for display.
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
  Widget build(BuildContext ctxt) {

    //populate department lists
    firstDeptList = PopulateHierarchyModel.getDeptFirstList(departmentModel);
    threeDeptList = PopulateHierarchyModel.getDeptThreeList(departmentModel);
    otherDeptList = PopulateHierarchyModel.getDeptOtherList(departmentModel);

    //populate catagory Lists
    firstMarkupList =
        PopulateHierarchyModel.getCatalogFirstList(departmentModel);
    threeList = PopulateHierarchyModel.getCatalogThreeList(departmentModel);
    otherList = PopulateHierarchyModel.getCatalogOtherList(departmentModel);

    //populate range lists
    firstRangeList =
        PopulateHierarchyModel.getRangeModelFirstList(departmentModel);
    threeRangeList = PopulateHierarchyModel.getThreeRangeList(departmentModel);
    otherRangeList = PopulateHierarchyModel.getOtherRangeList(departmentModel);

    //populate styles lists
    firstStyleList =
        PopulateHierarchyModel.getStyleModelFirstList(departmentModel);
    threeStyleList =
        PopulateHierarchyModel.getStyleModelThreeCList(departmentModel);
    otherStyleList =
        PopulateHierarchyModel.getStyleModelOtherList(departmentModel);

    switch (_selection) {
      case '1st':
        ListCount = firstDeptList.length;
        break;
      case '3c':
        ListCount = threeDeptList.length;
        break;
      case 'Other':
        ListCount = otherDeptList.length;
        break;
      default:
        ListCount = 0;
    }

    return Scaffold(
      appBar: AppBar(title: Text(subTitle, textAlign: TextAlign.center)),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: _buildProductItem(context, index),
              onTap: () {
                selectionId = index;
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => CatagoryView(selectionList, departmentModel, _selection,selectionId)),
                );
//            => Scaffold.of(context)
//                .showSnackBar(SnackBar(content: Text(index.toString()))),
              });
        },
        itemCount: ListCount,
      ),
    );
  }
}
