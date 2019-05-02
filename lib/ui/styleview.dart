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
import 'package:markdowns/models/firstmarkuprangemodel.dart';
import 'package:markdowns/models/firstmarkupstylemodel.dart';
import 'package:markdowns/models/threecrangemodel.dart';
import 'package:markdowns/models/threecstylemodel.dart';
import 'package:markdowns/models/otherrangemodel.dart';
import 'package:markdowns/models/otherstylemodel.dart';

class StyleView extends StatefulWidget {
//  final List<TestModel> products;
  List<dynamic> selectionList = new List();
  String _selection = "";
  final DepartmentModel departmentModel;
  int selectorID = 0;

  //populates array with array past into constructor
  StyleView(this.selectionList, this.departmentModel, this._selection,
      this.selectorID);

  @override
  State<StatefulWidget> createState() =>
      StyleViewState(selectionList, departmentModel, _selection, selectorID);
}

class StyleViewState extends State<StyleView> {
  final DepartmentModel departmentModel;
  int _currentIndex = 0;
  List<dynamic> selectionList = new List();
  int selectorID = 0;
  List<dynamic> selectedStyleList = new List();

  String _selection = "";

  Map<String, String> details = {
    'Description': '',
    'Rollup': '',
    'Found': '',
    'Outstanding': '',
    'Sold': ''
  };

  String subTitle = "Styles";
  int listCount = 0;
  Widget BuilderToUse;

  List<FirstMarkupRangeModel> firstMarkupRangeList = new List();
  List<ThreeCRangeModel> threeCRangeList = new List();
  List<OtherRangeModel> otherRangeList = new List();

  List<FirstMarkupStyleModel> firstMarkupStyleList = new List();
  List<ThreeCStyleModel> threeCStyleList = new List();
  List<OtherStyleModel> otherStyleList = new List();

  StyleViewState(this.selectionList, this.departmentModel, this._selection,
      this.selectorID);

  /* //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }*/

  @override
  Widget build(BuildContext context) {
    //use for testing, to delete
    String selectionListName = selectionList.runtimeType.toString();

    //todo : simulate the first selection to the others
    if (selectionList.first is FirstMarkupRangeModel) {
      for (int i = 0; i < selectionList.length; i++) {
        firstMarkupRangeList.add(selectionList[i]);
      }
      firstMarkupStyleList =
          firstMarkupRangeList[selectorID].firstMarkupStyleList;
      listCount = firstMarkupStyleList.length;
    } else if (selectionList.first is ThreeCRangeModel) {
      for (int i = 0; i < selectionList.length; i++) {
        threeCRangeList.add(selectionList[i]);
      }
      threeCStyleList = threeCRangeList[selectorID].threeCStyleModelList;
      listCount = threeCStyleList.length;
    } else if (selectionList.first is OtherRangeModel) {
      for (int i = 0; i < selectionList.length; i++) {
        otherRangeList.add(selectionList[i]);
      }
      otherStyleList = otherRangeList[selectorID].otherStyleModelList;
      listCount = otherStyleList.length;
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
              onTap: () {
                print(context.toString());
              }
//            => Scaffold.of(context)
//                .showSnackBar(SnackBar(content: Text(index.toString()))),
              );
        },
        itemCount: listCount,
      ),
    );
  }

  Widget _buildProductItemFirst(BuildContext context, int index) {
    details['Description'] = firstMarkupStyleList[index].styleNumber +
        " " +
        firstMarkupStyleList[index].styleDescription;
    details['Rollup'] =
        firstMarkupStyleList[index].currentRetekAmount.toString();
    details['Found'] = firstMarkupStyleList[index].foundAmount.toString();
    details['Outstanding'] = firstMarkupStyleList[index].outstanding.toString();
    details['Sold'] = firstMarkupStyleList[index].soldAmount.toString() + "?";
    List<dynamic> selectedStyleList = new List();



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
    details['Description'] = threeCStyleList[index].styleNumber +
        " " +
        threeCStyleList[index].styleDescription;
    details['Rollup'] = threeCStyleList[index].styleDescription;
    details['Found'] = threeCStyleList[index].currentRetekAmount.toString();
    details['Outstanding'] = threeCStyleList[index].foundAmount.toString();
    ;
    details['Sold'] = threeCStyleList[index].outstanding.toString();
    List<dynamic> selectedStyleList = new List();
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
    details['Description'] = otherStyleList[index].styleDescription +
        " " +
        otherStyleList[index].styleNumber;
    details['Rollup'] = otherStyleList[index].currentRetekAmount.toString();
    details['Found'] = otherStyleList[index].foundAmount.toString();
    details['Outstanding'] = otherStyleList[index].outstanding.toString();
    details['Sold'] = otherStyleList[index].soldAmount.toString() + "?";
    List<dynamic> selectedStyleList = new List();
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

  Widget pageToDisplay(BuildContext context, int index) {
    Widget temp;
    switch (_selection) {
      case "1st":
        temp = _buildProductItemFirst(context, index);
        return temp;
        break;
      case "3c":
        temp = _buildProductItemThreeC(context, index);
        return temp;
        break;
      case "Other":
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
