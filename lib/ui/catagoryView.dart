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
import 'package:markdowns/ui/rangeview.dart';

class CatagoryView extends StatefulWidget {
//  final List<TestModel> products;
  List<dynamic> selectionList = new List();
  String _selection = "";
  final DepartmentModel departmentModel;
  int selectionId = 0;
  //populates array with array past into constructor
  CatagoryView(this.selectionList,this.departmentModel, this._selection,this.selectionId);

  @override
  State<StatefulWidget> createState() => CatagoryViewState(selectionList,departmentModel,_selection,selectionId);

}

class CatagoryViewState extends State<CatagoryView>{

  final DepartmentModel departmentModel;
  int _currentIndex = 0;
  List<dynamic> selectionList = new List();
  int selectionId = 0;
  String _selection = "";
  List<dynamic> selectionCatList;

  Map<String, String> details = {
    'Description': '',
    'Rollup': '',
    'Found': '',
    'Outstanding': '',
    'Sold': ''
  };

  String subTitle = "Catagory";
  int listCount = 0;
  Widget BuilderToUse;

  List<FirstMarkdownDepartmentModel> firstDeptMarkupList = new List();
  List<ThreeCDepartmentModel> threeCDeptList = new List();
  List<OtherDepartmentModel> otherDeptList = new List();

  List<FirstMarkdownCategoryModel> firstMarkupCatList = new List();
  List<ThreeCCategoryModel> threeCatList = new List();
  List<OtherCategoryModel> otherCatList = new List();

  CatagoryViewState(this.selectionList,this.departmentModel, this._selection,this.selectionId);


 /* //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }*/


  @override
  Widget build(BuildContext context) {

    //use for testing, to delete
    String selectionListName = selectionList.runtimeType.toString();

    //todo : simulate the first selection to the others
    if(selectionList.last is FirstMarkdownDepartmentModel){
      for(int i = 0;i<selectionList.length;i++){
        firstDeptMarkupList.add(selectionList[i]);
      }
      firstMarkupCatList = firstDeptMarkupList[selectionId].firstMarkdownCategoryList;
      listCount = firstMarkupCatList.length;
    }else if(selectionList.last is ThreeCDepartmentModel){
        for(int i = 0;i<selectionList.length;i++){
          threeCDeptList.add(selectionList[i]);
        }
        threeCatList = threeCDeptList[selectionId].threeCCategoryList;
      listCount = threeCatList.length;
    }else if(selectionList.last is OtherDepartmentModel){
          for(int i = 0;i<selectionList.length;i++){
            otherDeptList.add(selectionList[i]);
          }
      otherCatList = otherDeptList[selectionId].otherCategoryList;
      listCount = otherCatList.length;
    }

    return Scaffold(
      appBar: AppBar(title: Text(subTitle, textAlign: TextAlign.center)
      ,automaticallyImplyLeading: true,
//        leading: IconButton(icon:Icon(Icons.arrow_back),
//      onPressed:() => Navigator.pop(context, false),
//    ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Markdown'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Scan'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Settings'))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: pageToDisplay(context, index),
//              child:  _buildProductItemFirst(context,index),
              onTap: () {
                selectionId = index;
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => RangeView(selectionCatList, departmentModel, _selection,selectionId)),
                );
              });
        },
        itemCount: listCount,

      ),
    );
  }
  Widget _buildProductItemFirst(BuildContext context, int index) {

    details['Description'] = firstMarkupCatList[index].categoryNumber +
        " " +
        firstMarkupCatList[index].categoryName;
    details['Rollup'] =
        firstMarkupCatList[index].rangeRollUp1stCurrentRetek.toString();
    details['Found'] =
        firstMarkupCatList[index].rangeRollUp1stFound.toString();
    details['Outstanding'] =
        firstMarkupCatList[index].rangeRollUp1stOutstanding.toString();
    details['Sold'] =
        firstMarkupCatList[index].rangeRolledUp1stSold.toString() + "?";
    selectionCatList = new List();
    selectionCatList.add(firstMarkupCatList[index]);
    
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

  Widget _buildProductItemThreeC(BuildContext context, int index) {

    details['Description'] = threeCatList[index].categoryNumber +
        " " +
        threeCatList[index].categoryName;
    details['Rollup'] =
        threeCatList[index].rangeRollUp3cCurrentRetek.toString();
    details['Found'] = threeCatList[index].rangeRollUp3cFound.toString();
    details['Outstanding'] =
        threeCatList[index].rangeRolledUp3cOutstanding.toString();
    details['Sold'] = threeCatList[index].rangeRolledUpc3Sold.toString() + "?";
    selectionCatList = new List();
    selectionCatList.add(threeCatList[index]);
    print("Catagory3c case shown");

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

  Widget _buildProductItemOther(BuildContext context, int index) {

    details['Description'] = otherCatList[index].categoryNumber +
        " " +
        otherCatList[index].categoryName;
    details['Rollup'] =
        otherCatList[index].rangeRollOtherCurrentRetek.toString();
    details['Found'] = otherCatList[index].rangeRollUpOtherFound.toString();
    details['Outstanding'] =
        otherCatList[index].rangeRolledOtherOutstanding.toString();
    details['Sold'] =
        otherCatList[index].rangeRolledUpOtherSold.toString() + "?";
    selectionCatList = new List();
    selectionCatList.add(otherCatList[index]);
    print("CategryOther case shown");

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

  Widget pageToDisplay(BuildContext context,int index) {

    Widget temp;
    switch(_selection){
      case "1st" :
        temp = _buildProductItemFirst(context, index);
        return temp;
        break;
      case "3c" :
        temp = _buildProductItemThreeC(context, index);
        return temp;
        break;
      case "Other" :
        temp = _buildProductItemOther(context, index);
        return temp;
        break;
      default: //todo :  create default widget to display empty values
    }

  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}