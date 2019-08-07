import 'package:flutter/material.dart';

// Loading 组件
class Loading extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
          color: Color.fromRGBO(43, 43, 48, 1),
          child: new Center(
            child: new Container(
                child: new Text(
                    'Loading...',
                    style:TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                    )
                ),
            ),
        ),
        );
    }
}

// 空数据组件
class Empty extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Center(
            child: new Container(
                child: new Text(
                    'No data！',
                    style:TextStyle(
                        fontSize: 35,
                    )
                ),
            ),
        );
    }
}
