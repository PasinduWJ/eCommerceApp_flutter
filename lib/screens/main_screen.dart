import 'package:ecommerce_app/screens/upload_product_form.dart';
import 'package:flutter/cupertino.dart';

import 'bottom_bar.dart';
import 'landing_page.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
