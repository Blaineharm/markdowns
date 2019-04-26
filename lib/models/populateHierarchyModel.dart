import 'package:markdowns/models/OtherCategoryModel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';
import 'package:markdowns/models/threeccategorymodel.dart';
import 'package:markdowns/models/markdownrangemodel.dart';
import 'package:markdowns/models/firstmarkdowndepartmentmodel.dart';
import 'package:markdowns/models/otherdepartmentmodel.dart';
import 'package:markdowns/models/threecdepartmentmodel.dart';

class PopulateHierarchyModel {

//  List<dynamic> getPopulatedList(
//      DepartmentModel departmentModel, String selection) {
//    switch (selection) {
//      case "Category1st":
//        var list = getCatalogFirstList(departmentModel);
//        return list;
//      case "Category3c":
//        var list = getCatalogThreeList(departmentModel);
//        return list;
//      case "CategoryOther":
//        var list = getCatalogOtherList(departmentModel);
//        return list;
//      case "Range1st":
//        var list = getRangeModelFirstList(departmentModel);
//        return list;
//      case "Range3c":
//        var list = getThreeRangeList(departmentModel);
//        return list;
//      case "RangeOther":
//        var list = getOtherRangeList(departmentModel);
//        return list;
//      default:
//        return null;
//    }
//  }

 static List<FirstMarkdownDepartmentModel> getDeptFirstList(DepartmentModel departmentModel){

   List<FirstMarkdownDepartmentModel> firstDeptList = new List();

   for(FirstMarkdownDepartmentModel firstMarkdownDepartmentModel in departmentModel.firstMarkdownDepratmentModelList){

     firstDeptList.add(firstMarkdownDepartmentModel);
   }
   return firstDeptList;

 }

 static List<OtherDepartmentModel> getDeptOtherList(DepartmentModel departmentModel){

   List<OtherDepartmentModel> otherDeptList = new List();

   for(OtherDepartmentModel otherDepartmentModel  in departmentModel.otherDepartmentModel){

     otherDeptList.add(otherDepartmentModel);
   }
   return otherDeptList;

 }

 static List<ThreeCDepartmentModel> getDeptThreeList(DepartmentModel departmentModel){

   List<ThreeCDepartmentModel> threeDeptList = new List();

   for(ThreeCDepartmentModel threeCDepartmentModel in departmentModel.threeCDepartmentModel){

     threeDeptList.add(threeCDepartmentModel);
   }
   return threeDeptList;

 }

 static List<FirstMarkdownCategoryModel> getCatalogFirstList(
      DepartmentModel departmentModel) {
    List<FirstMarkdownCategoryModel> firstCatList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (FirstMarkdownCategoryModel firstMarkdownCategoryModel
          in department.firstMarkdownCategoryList) {
        firstCatList.add(firstMarkdownCategoryModel);
      }
    }
    return firstCatList;
  }

  static List<ThreeCCategoryModel> getCatalogThreeList(
      DepartmentModel departmentModel) {
    List<ThreeCCategoryModel> threeCatList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (ThreeCCategoryModel threeCCategoryModel
          in department.threeCCategoryList) {
        threeCatList.add(threeCCategoryModel);
      }
    }
    return threeCatList;
  }

  static List<OtherCategoryModel> getCatalogOtherList(
      DepartmentModel departmentModel) {
    List<OtherCategoryModel> otherCatList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (OtherCategoryModel otherCategoryModel
          in department.otherCategoryList) {
        otherCatList.add(otherCategoryModel);
      }
    }
    return otherCatList;
  }

  static List<MarkdownRangeModel> getRangeModelFirstList(
      DepartmentModel departmentModel) {
    List<MarkdownRangeModel> firstRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (FirstMarkdownCategoryModel firstCategoryModel
          in department.firstMarkdownCategoryList) {
        for (MarkdownRangeModel firstMarkdownrange
            in firstCategoryModel.ranges) {
          firstRangeList.add(firstMarkdownrange);
        }
      }
    }
    return firstRangeList;
  }

  static List<MarkdownRangeModel> getThreeRangeList(DepartmentModel departmentModel) {
    List<MarkdownRangeModel> threeRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (ThreeCCategoryModel threeCCategoryModel
          in department.threeCCategoryList) {
        for (MarkdownRangeModel markdownRangeModel
            in threeCCategoryModel.ranges) {
          threeRangeList.add(markdownRangeModel);
        }
      }
    }
    return threeRangeList;
  }

  static List<MarkdownRangeModel> getOtherRangeList(DepartmentModel departmentModel) {
    List<MarkdownRangeModel> otherRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (OtherCategoryModel otherCategoryModel
          in department.otherCategoryList) {
        for (MarkdownRangeModel markdownRangeModel
            in otherCategoryModel.ranges) {
          otherRangeList.add(markdownRangeModel);
        }
      }
    }
    return otherRangeList;
  }



}
