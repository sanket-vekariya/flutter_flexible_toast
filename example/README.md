# flutter_flexible_toast Example

```
flutter_flexible_toast: ^0.1.2
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
    textColor: Colors.white,
    backgroundColor: Colors.black,
    timeInSeconds: 2);
```

### To cancel all the toasts call
```
FlutterFlexibleToast.cancel();
```
