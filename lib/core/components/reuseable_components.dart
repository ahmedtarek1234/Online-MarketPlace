import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget unDefineRoute() {
  return Scaffold(
    body: Center(
      child: Text("Route Name Not Found"),
    ),
  );
}

Widget routeField(
        {TextEditingController? controller,
        String? label = "",
        double? radius = 0,
        bool? setBackgroundColor = false}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label!),
        filled: setBackgroundColor,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );

// setLoading(BuildContext context, bool show) {
//   if (show) {
//     context.loaderOverlay.show(
//       widgetBuilder: (progress) {
//         return CircularProgressIndicator(
//           color: Colors.yellow,
//         );
//       },
//     );
//   } else {
//     context.loaderOverlay.hide();
//   }
// }
