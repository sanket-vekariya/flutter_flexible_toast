# flutter_flexible_toast

Toast Library for Flutter.

### How to Use
just add below in pubspec.yaml 
```
flutter_flexible_toast: ^0.1.4
```
```
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
```
```
FlutterFlexibleToast.showToast(
    message: "Short Loading 2 Sec Toast",
    toastLength: Toast.LENGTH_LONG,
    toastGravity: ToastGravity.BOTTOM,
    icon: ICON.LOADING,
    radius: 100,
    elevation: 10,
    imageSize: 35,
    textColor: Colors.white,
    backgroundColor: Colors.black,
    timeInSeconds: 2
);
```

### To cancel all the toasts call
```
FlutterFlexibleToast.cancel();
```

### Preview Screenshots 
![short_info_one_second_toast](https://user-images.githubusercontent.com/52414184/66133939-24589e80-e615-11e9-8cbb-20f79f917a1d.png)
![short_red_success_toast](https://user-images.githubusercontent.com/52414184/66134012-3f2b1300-e615-11e9-89dd-93b19d6de9c0.png)
![short_loading_gif_toast](https://user-images.githubusercontent.com/52414184/68575338-d8a9d800-0491-11ea-904d-9324b76ac617.gif)

### For More Info 
Email : android : ssvekariya11@gmail.com <br>
Email : ios : on iospareshse@gmail.com

