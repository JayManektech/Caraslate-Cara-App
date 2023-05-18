import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/routes.dart';
import 'package:caraslate_cara_app/gen/assets.gen.dart';
import 'package:caraslate_cara_app/model/job_list_model.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:caraslate_cara_app/wrapper/home_base_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends HomeBaseWrapperPage {
  const HomePage({Key? key}) : super(key: key, title: 'HomePage');

  @override
  HomeBaseState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeBaseState<HomePage> {
  final List<String> itemList = [];

  _addJobWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.jobLog);
        },
        child: Container(
            width: 8.0.w,
            height: 8.0.w,
            margin: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 5.0.w),
            decoration: const BoxDecoration(
                color: AppColors.getIconBgColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Icon(
              Icons.add,
              size: 8.0.w,
              color: AppColors.whiteColor,
            )),
      ),
    );
  }

  _checkJobCompletedOrSubmittedWidget(bool isDone) {
    return Expanded(
      child: Container(
        height: 10.0.h,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.jobTableColor)),
        child: isDone
            ? Assets.images.checkedIcon.image(width: 6.0.w)
            : Assets.images.crossIcon.image(width: 6.0.w),
      ),
    );
  }

  Widget _textItemWidget(String title,
      {Color? bgColor, Color? textColor, FontWeight? fontWeight}) {
    return Expanded(
      child: Container(
          height: 10.0.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.jobTableColor),
            color: bgColor,
          ),
          child: TextItemWidget(
            title: title,
            fontWeight: fontWeight,
            fontSize: 10.0.sp,
            textColor: textColor,
          )),
    );
  }

  @override
  Widget body() {
    // TODO: implement body
    return SingleChildScrollView(
      child: Column(
        children: [
          _addJobWidget(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2.w)),
            child: Column(
              children: [
                Row(
                  children: JobListModel.headers.map((e) {
                    return _textItemWidget(e,
                        bgColor: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.whiteColor);
                  }).toList(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index % 2 != 0
                          ? AppColors.jobTableColor
                          : AppColors.whiteColor,
                      child: Row(
                        children: [
                          _textItemWidget(jobList[index].jobName!,
                              fontWeight: FontWeight.bold),
                          _textItemWidget(jobList[index].log!,
                              fontWeight: FontWeight.bold),
                          _checkJobCompletedOrSubmittedWidget(
                              jobList[index].isCompleted!),
                          _checkJobCompletedOrSubmittedWidget(
                              jobList[index].isSubmitted!),
                        ],
                      ),
                    );
                  },
                  itemCount: jobList.length,
                ),
                SizedBox(
                  height: 10.0.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
