import 'package:flutter/material.dart';
import 'package:markdowns/controllers/placeholder_widget_controller.dart';
import 'package:markdowns/ui/sync.dart';
import 'package:markdowns/ui/hierarchyDrill.dart';
import 'package:markdowns/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:markdowns/services/markdownInfoWebservice.dart';
import 'package:markdowns/models/departmentModel.dart';
import 'package:markdowns/controllers/loadingscreencontroller.dart';
import 'package:async_loader/async_loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdowns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  String title;

  @override
  MyHomePageState createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  static Post post = new Post();
  static DepartmentModel departmentModel = new DepartmentModel();
  static bool uploaded = false;

  MyHomePageState();

  String title = "MarkedDowns";

  @override
  Widget build(BuildContext context) {

    Widget body = _pageToDisplay;

    return Scaffold(
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
      body: body,
     // HierarchyDrill(post),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

    static Future<Post> markdownWebService(Post p,DepartmentModel departmentModel) async{


      p = await createPost();
      if (p.departments != null) {
        callPopulateList(p, departmentModel);
        uploaded = true;
        return p;

      }
      uploaded = true;
      return p;
  }

  static void callPopulateList(Post p,DepartmentModel departmentModel){

    departmentModel.populateModelLists(p);
    print(departmentModel.listOfDepartments[0].departmentName);

  }
}
Widget get _pageToDisplay {
  if (MyHomePageState.uploaded) {
    return HierarchyDrill(MyHomePageState.departmentModel);
  } else {
    return _asyncLoader;
  }
}


final GlobalKey<AsyncLoaderState> _asyncLoaderState =
new GlobalKey<AsyncLoaderState>();

var _asyncLoader = new AsyncLoader(
  key: _asyncLoaderState,
  initState: () async => await MyHomePageState.markdownWebService(MyHomePageState.post, MyHomePageState.departmentModel),
  renderLoad: () => new CircularProgressIndicator(),
  renderError: ([error]) =>
  new Text('Sorry, there was an error loading'),
  renderSuccess: ({data}) => HierarchyDrill(MyHomePageState.departmentModel),
);