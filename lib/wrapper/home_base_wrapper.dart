import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/const_strings.dart';
import 'package:caraslate_cara_app/common/routes.dart';
import 'package:caraslate_cara_app/gen/assets.gen.dart';
import 'package:caraslate_cara_app/services/shared_pref_service.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

abstract class HomeBaseWrapperPage extends StatefulWidget {
  const HomeBaseWrapperPage({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;
}

abstract class HomeBaseState<Page extends HomeBaseWrapperPage>
    extends State<Page> {
  getLeadingTitle() {
    if (widget.title == 'JobLogPage') {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            padding: EdgeInsets.only(left: 2.0.w),
            child: Assets.images.homeIcon.image()),
      );
    }
    return TextItemWidget(title: DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: getLeadingTitle(),
        centerTitle: true,
        title: Assets.images.homeLogoImage.image(width: 38.0.h),
        toolbarHeight: 10.0.h,
        actions: [
          Center(
            child: TextItemWidget(
              title: 'Denis Jones',
              fontSize: 8.0.sp,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 2.0.w,
          ),
          GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(100, 100, 0, 0),
                  items: [
                    PopupMenuItem(
                      height: 10.0.h,
                      value: 'logout',
                      child: TextItemWidget(title: logoutTitle),
                    ),
                    // Add more PopupMenuItems as needed
                  ],
                  elevation: 8.0,
                ).then((value) {
                  if (value == 'logout') {
                    SharedPrefs.setBool('isLogin', false);
                    Get.offAllNamed(AppRoutes.login);
                  }
                });
              },
              child: Assets.images.settingsIcon.image(width: 5.0.w)),
          SizedBox(
            width: 3.0.w,
          ),
        ],
      ),
      body: body(),
    );
  }

  Widget body();
}
