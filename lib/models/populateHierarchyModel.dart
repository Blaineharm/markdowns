import 'package:markdowns/models/OtherCategoryModel.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/models/firstmarkdowncategorymodel.dart';
import 'package:markdowns/models/threeccategorymodel.dart';
import 'package:markdowns/models/firstmarkdowndepartmentmodel.dart';
import 'package:markdowns/models/otherdepartmentmodel.dart';
import 'package:markdowns/models/threecdepartmentmodel.dart';
import 'package:markdowns/models/firstmarkuprangemodel.dart';
import 'package:markdowns/models/firstmarkupstylemodel.dart';
import 'package:markdowns/models/threecrangemodel.dart';
import 'package:markdowns/models/threecstylemodel.dart';
import 'package:markdowns/models/otherrangemodel.dart';
import 'package:markdowns/models/otherstylemodel.dart';

class PopulateHierarchyModel {

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

  static List<FirstMarkupRangeModel> getRangeModelFirstList(
      DepartmentModel departmentModel) {
    List<FirstMarkupRangeModel> firstRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (FirstMarkdownCategoryModel firstCategoryModel
          in department.firstMarkdownCategoryList) {
        for (FirstMarkupRangeModel firstMarkdownrange
            in firstCategoryModel.firstMarkupRangeModel) {
          firstRangeList.add(firstMarkdownrange);
        }
      }
    }
    return firstRangeList;
  }

  static List<ThreeCRangeModel> getThreeRangeList(DepartmentModel departmentModel) {
    List<ThreeCRangeModel> threeRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (ThreeCCategoryModel threeCCategoryModel
          in department.threeCCategoryList) {
        for (ThreeCRangeModel threeRangeModel
            in threeCCategoryModel.threeCRangeList) {
          threeRangeList.add(threeRangeModel);
        }
      }
    }
    return threeRangeList;
  }

  static List<OtherRangeModel> getOtherRangeList(DepartmentModel departmentModel) {
    List<OtherRangeModel> otherRangeList = new List();

    for (DepartmentModel department in departmentModel.listOfDepartments) {
      for (OtherCategoryModel otherCategoryModel
          in department.otherCategoryList) {
        for (OtherRangeModel otherRangeModel
            in otherCategoryModel.otherRangeModel) {
          otherRangeList.add(otherRangeModel);
        }
      }
    }
    return otherRangeList;
  }

 static List<FirstMarkupStyleModel> getStyleModelFirstList(
     DepartmentModel departmentModel) {
   List<FirstMarkupStyleModel> firstStyleList = new List();

   for (DepartmentModel department in departmentModel.listOfDepartments) {
     for (FirstMarkdownCategoryModel firstCategoryModel
     in department.firstMarkdownCategoryList) {
       for (FirstMarkupRangeModel firstMarkdownrange
       in firstCategoryModel.firstMarkupRangeModel) {
         for(FirstMarkupStyleModel firstMarkupStyleModel in firstMarkdownrange.firstMarkupStyleList) {
           firstStyleList.add(firstMarkupStyleModel);
         }
       }
     }
   }
   return firstStyleList;
 }

 static List<ThreeCStyleModel> getStyleModelThreeCList(
     DepartmentModel departmentModel) {
   List<ThreeCStyleModel> firstStyleList = new List();

   for (DepartmentModel department in departmentModel.listOfDepartments) {
     for (ThreeCCategoryModel threeCCategoryModel
     in department.threeCCategoryList) {
       for (ThreeCRangeModel threeCRange
       in threeCCategoryModel.threeCRangeList) {
         for(ThreeCStyleModel threeCStyleModel in threeCRange.threeCStyleModelList) {
           firstStyleList.add(threeCStyleModel);
         }
       }
     }
   }
   return firstStyleList;
 }

 static List<OtherStyleModel> getStyleModelOtherList(
     DepartmentModel departmentModel) {
   List<OtherStyleModel> otherStyleList = new List();

   for (DepartmentModel department in departmentModel.listOfDepartments) {
     for (OtherCategoryModel otherCategoryModel
     in department.otherCategoryList) {
       for (OtherRangeModel otherRange
       in otherCategoryModel.otherRangeModel) {
         for(OtherStyleModel otherStyleModel in otherRange.otherStyleModelList) {
           otherStyleList .add(otherStyleModel);
         }
       }
     }
   }
   return otherStyleList;
 }

}
