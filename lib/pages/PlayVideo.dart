import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'dart:ui';

class PlayVideo extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() {
    return PlayVideoState();
  }
}

class PlayVideoState extends State<PlayVideo> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  bool isPlaying;

  @override
  void initState() {
    super.initState();
    print("======================");
    print(window.physicalSize.width);
    final screenWidth = window.physicalSize.width;
    final screenHeight = window.physicalSize.height;
    isPlaying = true;
    videoPlayerController = VideoPlayerController.network('https://cdn.moji.com/websrc/video/summer20190515.mp4');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: screenWidth / screenHeight,  //9:16
      autoPlay: true,
      looping: true,
      showControls: false,
    );
    // print("======================");
    // print(chewieController);
    // print("======================");
  }

  void _handleTapDown(pointerDownEvent) {
    print(videoPlayerController);
    var playingStatus = videoPlayerController.value.isPlaying;
     if(playingStatus == true){
        videoPlayerController.pause();
        // setState(() {
        //   isPlaying = false;
        // });
     }else{
       videoPlayerController.play();
     }
     
  }
  
  void _testClick() {
    print("==========dianji======test=====");
    
  }

  Widget topArea(){
    return Text("555");
  }

  

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    // print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    // print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    
    Widget liveInfo(data){
       return Container(
         height: ScreenUtil.getInstance().setWidth(120),
         width: ScreenUtil.getInstance().setWidth(375),
        //  color: Colors.blue,
         child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("ddd dddd ddd",style: TextStyle(
               color: Colors.white,
               fontSize: ScreenUtil.getInstance().setWidth(18),
             ),),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Image.asset(
                   './images/btLiveGiftSpecialNormal.png',
                   width: ScreenUtil.getInstance().setWidth(12),
                   height: ScreenUtil.getInstance().setWidth(12),
                   ),
                   Text('rrrrr',style:TextStyle(
                     color: Colors.white,
                     fontSize: ScreenUtil.getInstance().setWidth(12),
                   )),
                   Container(width: 20,height:40),
                   Image.asset(
                   './images/btLiveGiftSpecialNormal.png',
                   width: ScreenUtil.getInstance().setWidth(12),
                   height: ScreenUtil.getInstance().setWidth(12),
                   ),
                   Text('rrrrr',style:TextStyle(
                     color: Colors.white,
                     fontSize: ScreenUtil.getInstance().setWidth(12),
                   )),
               ],
             ),
             Text("00:42",style: TextStyle(
               color: Colors.white,
               fontSize: ScreenUtil.getInstance().setWidth(18),
             ),),
           ],
         ),
       );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Listener(
            child: Container(
              // color: Colors.yellow,
              child: Chewie(
                    controller: chewieController,
                  ),
            ),
            onPointerDown: _handleTapDown,
          ),
          Positioned(
            top: ScreenUtil.getInstance().setWidth(30),
            left: 0,
            child: liveInfo("666"),
          ),
          Positioned(         //留言输入框
            bottom: ScreenUtil.getInstance().setWidth(12),
            left: ScreenUtil.getInstance().setWidth(15),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(211),
              height: ScreenUtil.getInstance().setWidth(36),
              alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0,0,0,0.5),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                autofocus: false,
                style: TextStyle(color: Colors.white,),
                decoration: InputDecoration(
                  hintText: "say something nice",
                  border: InputBorder.none,
                  // fillColor: Colors.blue,
                  // filled: true,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(50),
            left: ScreenUtil.getInstance().setWidth(233),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(60),
              height:ScreenUtil.getInstance().setWidth(14),
              // color: Colors.blue,
              child: Text("222/222",
                style: TextStyle(
                  color:Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setHeight(12),
            right: ScreenUtil.getInstance().setWidth(103),
            child: GestureDetector(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(36),
                height: ScreenUtil.getInstance().setWidth(36),
                // color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('./images/btLiveGiftSpecialNormal.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: ()=> _testClick(),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(12),
            right: ScreenUtil.getInstance().setWidth(57),
            child: GestureDetector(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(36),
                height: ScreenUtil.getInstance().setWidth(36),
                // color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('./images/btLiveMoreNormal.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: ()=> _testClick(),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.getInstance().setWidth(12),
            right: ScreenUtil.getInstance().setWidth(11),
            child: GestureDetector(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(36),
                height: ScreenUtil.getInstance().setWidth(36),
                // color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('./images/btLiveExitNormal.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: ()=> _testClick(),
            ),
          ),

        ],
        
      ),
      
    );
    
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}

