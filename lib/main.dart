import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/WatchVideoList.dart';
import 'pages/TopUp.dart';
import 'pages/PlayVideo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Object params = {"aa":1,"bb":2};
    void testfn(data){
      print("正在执行回调函数");
      print(data);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // backgroundColor: const Color.fromRGBO(43,43,48,1),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'video page',aa: params,callback:testfn),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.aa, this.callback}) : super(key: key);
  final String title;
  final Object aa;
  final callback;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    // print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    // print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    // print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    // print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    
    // print(widget.aa);
    // widget.callback("huihuihuihu");
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(100),
            left: ScreenUtil.getInstance().setWidth(200),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(50),
              height:ScreenUtil.getInstance().setWidth(50),
              color: Colors.blue,
              child: GestureDetector(
                child: Container(
                  child: Text("跳转列表页"),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) {return new WatchVideoList();}));
                },
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(400),
            left: ScreenUtil.getInstance().setWidth(200),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(50),
              height:ScreenUtil.getInstance().setWidth(50),
              color: Colors.yellow,
              child: GestureDetector(
                child: Container(
                  child: Text("跳转coin列表页"),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) {return new TopUp();}));
                },
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(400),
            left: ScreenUtil.getInstance().setWidth(100),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(50),
              height:ScreenUtil.getInstance().setWidth(50),
              color: Colors.yellow,
              child: GestureDetector(
                child: Container(
                  child: Text("跳转live列表页"),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) {return new PlayVideo();}));
                },
              ),
            ),
          ),
        ],
        
      ),
      
    );
  }

  @override
  void dispose() {
   
    super.dispose();
  }
}


  