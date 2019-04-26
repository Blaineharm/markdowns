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

class CatagoryView extends StatefulWidget {
//  final List<TestModel> products;
  List<dynamic> selectionList = new List();
  String _selection = "";
  final DepartmentModel departmentModel;
  int selectorID = 0;
  //populates array with array past into constructor
  CatagoryView(this.selectionList,this.departmentModel, this._selection,this.selectorID);

  @override
  State<StatefulWidget> createState() => CatagoryViewState(selectionList,departmentModel,_selection,selectorID);

}

class CatagoryViewState extends State<CatagoryView>{

  final DepartmentModel departmentModel;
  int _currentIndex = 0;
  List<dynamic> selectionList = new List();
  int selectorID = 0;

  String _selection = "";

  Map<String, String> details = {
    'Description': '',
    'Rollup': '',
    'Found': '',
    'Outstanding': '',
    'Sold': ''
  };

  String subTitle = "";
  int listCount = 0;
  Widget BuilderToUse;

  List<FirstMarkdownDepartmentModel> firstDeptMarkupList = new List();
  List<FirstMarkdownCategoryModel> firstMarkupList = new List();
  List<ThreeCCategoryModel> threeList = new List();
  List<OtherCategoryModel> otherList = new List();

  CatagoryViewState(this.selectionList,this.departmentModel, this._selection,this.selectorID);


  //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }



  @override
  Widget build(BuildContext context) {

    String selectionListName = selectionList.runtimeType.toString();

    //todo : simulate the first selection to the others
    if(selectionList.first is FirstMarkdownDepartmentModel){
      for(int i = 0;i<selectionList.length;i++){
        firstDeptMarkupList.add(selectionList[i]);
      }
      firstMarkupList = firstDeptMarkupList[selectorID].firstMarkdownCategoryList;
//      firstMarkupList = selectionList;
      listCount = firstMarkupList.length;
    }else if(selectionList.runtimeType is ThreeCCategoryModel){
      threeList = selectionList;
      listCount = threeList.length;
    }else if(selectionList.runtimeType is OtherCategoryModel){
      otherList = selectionList;
      listCount = otherList.length;
    }

    return Scaffold(
      appBar: AppBar(title: Text(subTitle, textAlign: TextAlign.center)),
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
              onTap: () {print(context.toString());}
//            => Scaffold.of(context)
//                .showSnackBar(SnackBar(content: Text(index.toString()))),
          );
        },
        itemCount: listCount,

      ),
    );
  }
  Widget _buildProductItemFirst(BuildContext context, int index) {

    details['Description'] = firstMarkupList[index].categoryNumber +
        " " +
        firstMarkupList[index].categoryName;
    details['Rollup'] =
        firstMarkupList[index].rangeRollUp1stCurrentRetek.toString();
    details['Found'] =
        firstMarkupList[index].rangeRollUp1stFound.toString();
    details['Outstanding'] =
        firstMarkupList[index].rangeRollUp1stOutstanding.toString();
    details['Sold'] =
        firstMarkupList[index].rangeRolledUp1stSold.toString() + "?";

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

    details['Description'] = threeList[index].categoryNumber +
        " " +
        threeList[index].categoryName;
    details['Rollup'] =
        threeList[index].rangeRollUp3cCurrentRetek.toString();
    details['Found'] = threeList[index].rangeRollUp3cFound.toString();
    details['Outstanding'] =
        threeList[index].rangeRolledUp3cOutstanding.toString();
    details['Sold'] = threeList[index].rangeRolledUpc3Sold.toString() + "?";
    print("Categry3c case shown");

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

    details['Description'] = otherList[index].categoryNumber +
        " " +
        otherList[index].categoryName;
    details['Rollup'] =
        otherList[index].rangeRollOtherCurrentRetek.toString();
    details['Found'] = otherList[index].rangeRollUpOtherFound.toString();
    details['Outstanding'] =
        otherList[index].rangeRolledOtherOutstanding.toString();
    details['Sold'] =
        otherList[index].rangeRolledUpOtherSold.toString() + "?";
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
      case "other" :
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