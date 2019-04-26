import 'package:flutter/material.dart';
import 'package:markdowns/models/testModel.dart';
import 'package:markdowns/ui/mainhierarchy.dart';
import 'package:markdowns/models/post.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/main.dart';

class HierarchyDrill extends StatefulWidget{

  DepartmentModel departmentModel;

  //default selection used for testing;
  String selection = "Range1st";

  HierarchyDrill(this.departmentModel);

  @override
  State<StatefulWidget> createState() => HierarchyDrillState(this.departmentModel,this.selection);

}

class HierarchyDrillState extends State<HierarchyDrill>{

  DepartmentModel departmentModel;
  String selection;

  HierarchyDrillState(this.departmentModel,this.selection);

  //List<TestModel> testModelList = TestModel.populateTestList();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("test", textAlign: TextAlign.center)),
      ),
      body: MainHierarchy(this.departmentModel,this.selection),

    );
  }

}