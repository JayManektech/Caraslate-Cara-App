import 'dart:convert';

import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/const_strings.dart';
import 'package:caraslate_cara_app/controller/home_controller.dart';
import 'package:caraslate_cara_app/model/intern_time_processing_model.dart';
import 'package:caraslate_cara_app/model/table_info_model.dart';
import 'package:caraslate_cara_app/widgets/show_dialog_graffiti.dart';
import 'package:caraslate_cara_app/widgets/show_dialog_signature.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:caraslate_cara_app/wrapper/home_base_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'package:sizer/sizer.dart';

class JobLogPage extends HomeBaseWrapperPage {
  const JobLogPage({Key? key}) : super(key: key, title: 'JobLogPage');

  @override
  HomeBaseState<JobLogPage> createState() => _JobLogPageState();
}

class _JobLogPageState extends HomeBaseState<JobLogPage> {
  final List<String> logTableLabelList = [
    'Date',
    'Customer',
    'Site Name',
    'Log#'
  ];
  List<String> serviceTypeList = [
    'Liter Abatement',
    'Snow Removal',
    'Grafitti',
    'Landscrapping',
    'Janitorial (Interior)',
    'Pressure Wash',
    'Service',
    'Spcial Event'
  ];
  final signController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final TextEditingController noteController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  late TimeOfDay _selectedTime;
  List<String> nullList = [
    '',
    '',
    '',
    '',
    '27',
    '12',
    '42',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  Color getColor() {
    internTimeList.map((internTime) {
      print('internTIme -> ${internTime.fullName}');
      if (internTime.fullName == 'Total') {
        return AppColors.lightGreyColor;
      }
    });
    return AppColors.whiteColor;
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget body() {
    // TODO: implement body
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextItemWidget(
                title: cleanSlateLogTitle,
                fontWeight: FontWeight.bold,
                fontSize: 10.0.sp),
            Container(
              padding: EdgeInsets.only(top: 3.0.h),
              child: Row(
                children: [
                  _textItemWidget("Date",
                      bgColor: AppColors.reportBtnColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0.sp,
                      textColor: AppColors.whiteColor),
                  _textItemWidget("Customer",
                      bgColor: AppColors.reportBtnColor,
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.whiteColor),
                  _textItemWidget("Site Name",
                      bgColor: AppColors.reportBtnColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0.sp,
                      textColor: AppColors.whiteColor),
                  _textItemWidget("Log #",
                      fontSize: 10.0.sp,
                      bgColor: AppColors.reportBtnColor,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.whiteColor),
                ],
              ),
            ),
            Row(
              children: [
                Obx(
                  () => _textItemWidget(
                    homeController.dateTime.value,
                    onBtnPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now())
                          .then((value) {
                        if (value != null) {
                          homeController.dateTime.value =
                              DateFormat('MM/dd/yy').format(value);
                        }
                      });
                    },
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0.sp,
                  ),
                ),
                _textItemWidget(
                  "Uptown",
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0.sp,
                ),
                _textItemWidget(
                  "Broadway",
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0.sp,
                ),
                _textItemWidget(
                  "10-580-22",
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0.sp,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 3.0.h),
              child: Row(children: [
                _operationalAndTimeTableWidget(
                    operationalInfoTitle, operationalList),
                SizedBox(
                  width: 3.0.w,
                ),
                _operationalAndTimeTableWidget(
                    timeDetailTitle, timeDetailsList),
                SizedBox(
                  width: 3.0.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            _tableTitleWidget(serviceTitle),
                            _dropdownWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Row(
                        children: [
                          _textItemWidget('Lunch In', fontSize: 7.0.sp),
                          _textItemWidget('11:30 PM', fontSize: 7.0.sp),
                        ],
                      ),
                      Row(
                        children: [
                          _textItemWidget('Lunch Out', fontSize: 7.0.sp),
                          _textItemWidget('12:00 PM', fontSize: 7.0.sp),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0.w),
              child: Column(
                children: [
                  _tableTitleWidget(internTimeTitle),
                  Row(
                    children: [
                      Column(
                        children: [
                          DataTable(
                            decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                border: Border.all(color: Colors.grey)),
                            dataRowColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) =>
                                    AppColors.whiteColor),
                            border: TableBorder.all(color: Colors.grey),
                            columns: [
                              DataColumn(
                                label: _textItemTableWidget(
                                  'Full Name',
                                  bgColor: AppColors.lightGreyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 7.0.sp,
                                ),
                              ),
                            ],
                            rows: internTimeList.map((internTime) {
                              return DataRow(cells: [
                                DataCell(_textItemTableWidget(
                                    internTime.fullName ?? '',
                                    bgColor: AppColors.lightGreyColor,
                                    fontSize: 6.0.sp)),
                              ]);
                            }).toList(),
                          ),
                          Container(
                            height: 5.0.h,
                            width: 33.0.w,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: _textItemTableWidget('Totals',
                                  bgColor: AppColors.lightGreyColor,
                                  fontSize: 6.0.sp),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              DataTable(
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreyColor,
                                    border: Border.all(color: Colors.grey)),
                                border: TableBorder.all(color: Colors.grey),
                                dataRowColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.whiteColor),
                                columns:
                                    InternTimeProcessingModel.headers.map((e) {
                                  return DataColumn(
                                      label: Container(
                                          width: 120,
                                          child: _textItemTableWidget(
                                            e,
                                            bgColor: AppColors.lightGreyColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 7.0.sp,
                                          )));
                                }).toList(),
                                rows: internTimeList.map((internTime) {
                                  return DataRow(cells: [
                                    DataCell(getSignature(internTime),
                                        onTap: () {
                                      showSignatureDialog(context, internTime,
                                          (value) {
                                        internTime.signature = value;
                                        setState(() {});
                                      }, signController);
                                    }),
                                    DataCell(_textItemTableWidget(
                                        internTime.timeIn ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.timeOut ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.assignment ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.blackBags ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.blueBags ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.receptables ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.crossWalks ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.busStops ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.lots ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.treeGrates ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.planters ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                    DataCell(_textItemTableWidget(
                                        internTime.signs ?? '',
                                        fontSize: 6.0.sp,
                                        fontWeight: getFontWeight(internTime))),
                                  ]);
                                }).toList(),
                              ),
                              DataTable(
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreyColor,
                                    border: Border.all(color: Colors.grey)),
                                border: TableBorder.all(color: Colors.grey),
                                dataRowColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.whiteColor),
                                columns: nullList.map((e) {
                                  return DataColumn(
                                      label: Container(
                                          width: 120,
                                          child: _textItemTableWidget(
                                            e,
                                            bgColor: AppColors.lightGreyColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 7.0.sp,
                                          )));
                                }).toList(),
                                rows: const [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _bottomBtnWidget(),
          ],
        ),
      ),
    );
  }

  _dropdownWidget() {
    return Container(
      height: 5.0.h,
      padding: EdgeInsets.only(left: 2.0.w),
      child: DropdownButtonHideUnderline(
          child: Obx(
        () => DropdownButton<String>(
          value: homeController.serviceTypeValue.isNotEmpty
              ? homeController.serviceTypeValue.value
              : serviceTypeList[0],
          onChanged: (String? newValue) {
            homeController.serviceTypeValue.value = newValue!;
          },
          isExpanded: true,
          items: serviceTypeList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextItemWidget(title: value, fontSize: 7.0.sp),
            );
          }).toList(),
        ),
      )),
    );
  }

  getSignature(internTime) {
    if (internTime.signature != null) {
      return Image.memory(
        base64Decode(internTime.signature),
        width: 15.0.w,
        fit: BoxFit.fill,
      );
    }
    return _textItemTableWidget(
      '',
      fontSize: 6.0.sp,
      fontWeight: getFontWeight(internTime),
    );
  }

  getFontWeight(internTime) =>
      internTime.fullName == 'Total' ? FontWeight.bold : FontWeight.normal;

  _bottomBtnWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0.h),
      child: Row(
        children: [
          MaterialButton(
            minWidth: 10.0.w,
            height: 7.0.h,
            onPressed: () {
              showDialogReportGraffiti(context);
            },
            color: AppColors.reportBtnColor,
            child: TextItemWidget(
              title: reportGraffiti,
              textColor: AppColors.whiteColor,
              fontSize: 8.0.sp,
            ),
          ),
          const Spacer(),
          MaterialButton(
            minWidth: 10.0.w,
            height: 7.0.h,
            onPressed: () {
              showDialogOfficeNoteSign(context, noteController, signController);
            },
            color: AppColors.crewChiefBtnColor,
            child: TextItemWidget(
              title: crewChiefTitle,
              textAlign: TextAlign.center,
              textColor: AppColors.whiteColor,
              fontSize: 8.0.sp,
            ),
          ),
        ],
      ),
    );
  }

  _operationalAndTimeTableWidget(String title, List list) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            _tableTitleWidget(title),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textItemWidget(list[index].title,
                        padding: EdgeInsets.only(left: 2.0.w),
                        fontSize: 7.0.sp,
                        alignment: Alignment.centerLeft),
                    _textItemWidget(list[index].subtitle,
                        padding: EdgeInsets.only(right: 2.0.w),
                        fontSize: 7.0.sp,
                        alignment: Alignment.centerRight),
                  ],
                );
              },
              itemCount: list.length,
            ),
          ],
        ),
      ),
    );
  }

  _tableTitleWidget(String title) {
    return Container(
        height: 6.0.h,
        padding: EdgeInsets.only(left: 2.0.w),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        color: AppColors.reportBtnColor,
        child: TextItemWidget(
          title: title,
          fontSize: 8.0.sp,
          textColor: AppColors.whiteColor,
        ));
  }

  Widget _textItemWidget(String title,
      {Color? bgColor,
      double? fontSize,
      Color? textColor,
      VoidCallback? onBtnPressed,
      EdgeInsetsGeometry? padding,
      AlignmentGeometry? alignment,
      FontWeight? fontWeight}) {
    return Expanded(
        child: GestureDetector(
      onTap: onBtnPressed,
      child: Container(
          height: 7.0.h,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          decoration: BoxDecoration(
              color: bgColor, border: Border.all(color: Colors.grey)),
          child: TextItemWidget(
            title: title,
            fontWeight: fontWeight,
            fontSize: fontSize,
            textColor: textColor,
          )),
    ));
  }

  Widget _textItemTableWidget(String title,
      {Color? bgColor,
      double? fontSize,
      Color? textColor,
      FontWeight? fontWeight}) {
    return TextItemWidget(
      title: title,
      textAlign: TextAlign.center,
      fontWeight: fontWeight,
      fontSize: fontSize,
      textColor: textColor,
    );
  }
}
