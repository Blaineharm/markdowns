import 'package:markdowns/models/post.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:markdowns/main.dart';

//  String url = 'http://localhost:64693/MarkdownService.svc/MarkdownInfo/';

//ip to be changed to current local ip address as well as applicationhost.config
// located at C:\Projects\Collection2012\MarkDownsMobile\.vs\config
String url = 'http://10.14.9.60:64693/MarkdownService.svc/MarkdownInfo/';


//test parameters for populating hierarchy screen
Map paramDic = {"Barcode": "2101013291312", "StoreCode": "0890"};

var body = json.encode(paramDic);

Future<Post> createPost() async {
  if (MyHomePageState.uploaded) {
    return null;
  } else {
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      print("${response.statusCode}");
      throw new Exception("Error while fetching data");
    }

    print("${response.statusCode}");
    print("${response.body}");
    return Post.fromJson(json.decode(response.body));
  }

//  return response;
// p = Post.fromJson(json.decode(response.body));
}
