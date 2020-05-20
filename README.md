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
![short_info_one_second_toast](https://user-images.githubusercontent.com/52414184/82424169-69491c80-9aa2-11ea-8fb2-b60d6daa2b03.jpg)

### For More Info 
Email : android : ssvekariya11@gmail.com <br>
Email : ios : on iospareshse@gmail.com

