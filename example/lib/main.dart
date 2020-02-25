import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  void showLongToast() {
    FlutterFlexibleToast.showToast(
      message: "Long Simple Toast",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void showColoredToast() {
    FlutterFlexibleToast.showToast(
        message: "Short red Success Toast",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        icon: ICON.SUCCESS,
        fontSize: 16,
        imageSize: 35,
        textColor: Colors.white);
  }

  void showShortToast() {
    FlutterFlexibleToast.showToast(
        message: "Short Info 1 Sec Toast",
        toastLength: Toast.LENGTH_SHORT,
        icon: ICON.INFO,
        timeInSeconds: 1);
  }

  void showTopShortToast() {
    FlutterFlexibleToast.showToast(
        message: "Top Short Warning 1 Sec Toast",
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.TOP,
        icon: ICON.WARNING,
        timeInSeconds: 1);
  }

  void showCenterShortToast() {
    FlutterFlexibleToast.showToast(
        message: "Center Short Warning 1 Sec Toast",
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.CENTER,
        icon: ICON.WARNING,
        timeInSeconds: 1);
  }

  void showCenterShortLoadingToast() {
    FlutterFlexibleToast.showToast(
        message: "Short Loading 2 Sec Toast",
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.BOTTOM,
        icon: ICON.LOADING,
        radius: 20,
        elevation: 10,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        timeInSeconds: 2);
  }

  void cancelToast() {
    FlutterFlexibleToast.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Flexible Toast'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Long Simple Toast'),
                    onPressed: showLongToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Short Info 1 Sec Toast'),
                    onPressed: showShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Center Short Warning 1 Sec Toast'),
                    onPressed: showCenterShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Top Short Warning 1 Sec Toast'),
                    onPressed: showTopShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Short red Success Toast'),
                    onPressed: showColoredToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Short Loading 2 Sec Toast'),
                    onPressed: showCenterShortLoadingToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                  child: new Text('Cancel Toasts'),
                  onPressed: cancelToast,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
