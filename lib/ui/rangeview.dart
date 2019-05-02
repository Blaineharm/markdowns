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
import 'package:markdowns/ui/styleview.dart';
class RangeView extends StatefulWidget {
//  final List<TestModel> products;
  List<dynamic> selectionList = new List();
  String _selection = "";
  final DepartmentModel departmentModel;
  int selectionId = 0;
  //populates array with array past into constructor
  RangeView(this.selectionList,this.departmentModel, this._selection,this.selectionId);

  @override
  State<StatefulWidget> createState() => RangeViewState(selectionList,departmentModel,_selection,selectionId);

}

class RangeViewState extends State<RangeView>{

  final DepartmentModel departmentModel;
  int _currentIndex = 0;
  List<dynamic> selectionList = new List();
  int selectionId = 0;
  List<dynamic> selectionRangeList = new List();

  String _selection = "";

  Map<String, String> details = {
    'Description': '',
    'Rollup': '',
    'Found': '',
    'Outstanding': '',
    'Sold': ''
  };

  String subTitle = "Ranges";
  int listCount = 0;
  Widget BuilderToUse;

  List<FirstMarkdownCategoryModel> firstMarkupCatList = new List();
  List<ThreeCCategoryModel> threeCatList = new List();
  List<OtherCategoryModel> otherCatList = new List();

  List<FirstMarkupRangeModel> firstMarkupRangeList = new List();
  List<ThreeCRangeModel> threeCRangeList = new List();
  List<OtherRangeModel> otherRangeList = new List();


  RangeViewState(this.selectionList,this.departmentModel, this._selection,this.selectionId);

  /* //method shows elements in given list
  void testArray(List<TestModel> listToTest) {
    listToTest.forEach((element) => print(element));
  }*/

  @override
  Widget build(BuildContext context) {

    //use for testing, to delete
    String selectionListName = selectionList.runtimeType.toString();

    //todo : simulate the first selection to the others
    if(selectionList.last is FirstMarkdownCategoryModel){
      for(int i = 0;i<selectionList.length;i++){
        firstMarkupCatList.add(selectionList[i]);
      }
      firstMarkupRangeList = firstMarkupCatList[selectionId].firstMarkupRangeModel;
      listCount = firstMarkupRangeList.length;
    }else if(selectionList.last is ThreeCCategoryModel){
      for(int i = 0;i<selectionList.length;i++){
       threeCatList.add(selectionList[i]);
      }
      threeCRangeList = threeCatList[selectionId].threeCRangeList;
      listCount = threeCRangeList.length;
    }else if(selectionList.last is OtherCategoryModel){
      for(int i = 0;i<selectionList.length;i++){
        otherCatList.add(selectionList[i]);
      }
      otherRangeList = otherCatList[selectionId].otherRangeModel;
      listCount = otherRangeList.length;
    }

    return Scaffold(
      appBar:AppBar(title: Text(subTitle, textAlign: TextAlign.center)
        ,automaticallyImplyLeading: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
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
                  new MaterialPageRoute(builder: (context) => StyleView(selectionRangeList, departmentModel, _selection,selectionId)),
                );

              });
        },
        itemCount: listCount,

      ),
    );
  }
  Widget _buildProductItemFirst(BuildContext context, int index) {

    details['Description'] = firstMarkupRangeList[index].rangeNumber +
        " " +
        firstMarkupRangeList[index].rangeName;
    details['Rollup'] =
    firstMarkupRangeList[index].styleRollUp1StCurrentRetek.toString();
    details['Found'] =
    firstMarkupRangeList[index].styleRollUp1StFound.toString();
    details['Outstanding'] =
        firstMarkupRangeList[index].styleRolledUp1stOutstanding.toString();
    details['Sold'] =
        firstMarkupRangeList[index].styleRolledUp1stSold.toString() + "?";
    selectionRangeList = new List();
    selectionRangeList.add(firstMarkupRangeList[index]);
    print("Range first");

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

    details['Description'] = threeCRangeList[index].rangeNumber +
        " " +
        threeCRangeList[index].rangeName;
    details['Rollup'] =
    threeCRangeList[index].styleRollUp3CCurrentRetek.toString();
    details['Found'] = threeCRangeList[index].styleRollUp3CFound.toString();
    details['Outstanding'] =
    threeCRangeList[index].styleRolledUp3cOutstanding.toString();
    details['Sold'] = threeCRangeList[index].styleRolledUp3CSold.toString() + "?";
    selectionRangeList = new List();
    selectionRangeList.add(threeCRangeList[index]);
    print("Range 3c");


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

    details['Description'] = otherRangeList[index].rangeNumber+
        " " +
        otherRangeList[index].rangeName;
    details['Rollup'] =
        otherRangeList[index].styleRollUpOtherCurrentRetek.toString();
    details['Found'] = otherRangeList[index].styleRollUpOtherFound.toString();
    details['Outstanding'] =
        otherRangeList[index].styleRolledUpOtherOutstanding.toString();
    details['Sold'] =
        otherRangeList[index].styleRolledUpOtherSold.toString() + "?";
    selectionRangeList = new List();
    selectionRangeList.add(otherRangeList[index]);
    print("Range Other");

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