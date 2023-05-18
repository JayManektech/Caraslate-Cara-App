import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/const_strings.dart';
import 'package:caraslate_cara_app/widgets/text_form_field_widget.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:sizer/sizer.dart';

showSignatureDialog(BuildContext context, internTime,
    Function(String?) onSubmit, SignatureController controller) {
  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: TextItemWidget(
              title: internTime.fullName!,
              textAlign: TextAlign.center,
              fontSize: 10.0.sp,
            ),
            content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextItemWidget(
                      title: signTitle,
                      fontSize: 7.0.sp,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.reportBtnColor)),
                      child: Signature(
                        controller: controller,
                        height: 10.0.h,
                        backgroundColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                )),
            actions: [
              MaterialButton(
                onPressed: () {
                  controller.undo();
                },
                height: 4.0.h,
                minWidth: 10.0.w,
                color: AppColors.reportBtnColor,
                child: const TextItemWidget(
                    title: redoTitle, textColor: AppColors.whiteColor),
              ),
              SizedBox(
                width: 2.0.w,
              ),
              MaterialButton(
                onPressed: () async {
                  ui.Image? image = await controller.toImage();
                  final ByteData? byteData =
                      await image?.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List? list = byteData?.buffer.asUint8List();
                  Navigator.of(context).pop();
                  String? imgName;
                  if (list != null) {
                    imgName = base64Encode(list);
                  }
                  onSubmit(imgName);
                },
                height: 4.0.h,
                minWidth: 10.0.w,
                color: AppColors.acceptSignColor,
                child: const TextItemWidget(
                    title: acceptTitle, textColor: AppColors.whiteColor),
              ),
              SizedBox(
                width: 4.0.w,
              ),
            ],
          );
        });
      }).then((value) {
    controller.clear();
  });
}

showDialogOfficeNoteSign(BuildContext context,
    TextEditingController noteController, SignatureController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
            title: Center(
                child: TextItemWidget(
              title: noteOfficeTitle,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.bold,
            )),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextItemWidget(
                          title: crewChiefCheckTitle,
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          value: crewChiefCheckList[index].isChecked,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            crewChiefCheckList[index].isChecked =
                                !crewChiefCheckList[index].isChecked;
                            setState(() {});
                          },
                          title: TextItemWidget(
                            title: crewChiefCheckList[index].title,
                            fontSize: 7.0.sp,
                          ),
                        );
                      },
                      itemCount: crewChiefCheckList.length,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextItemWidget(
                          title: noShowInternTitle,
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: TextItemWidget(
                                title: noShowLateReturnList[index].title,
                                fontSize: 7.0.sp,
                              ),
                            ),
                            Checkbox(
                              value: noShowLateReturnList[index].isLate,
                              onChanged: (value) {
                                noShowLateReturnList[index].isLate = value!;
                                if (value) {
                                  noShowLateReturnList[index].isNoShow = false;
                                }
                                setState(() {});
                              },
                            ),
                            Checkbox(
                              value: noShowLateReturnList[index].isNoShow,
                              onChanged: (value) {
                                noShowLateReturnList[index].isNoShow = value!;
                                if (value) {
                                  noShowLateReturnList[index].isLate = false;
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        );
                      },
                      itemCount: noShowLateReturnList.length,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 8),
                        child: TextItemWidget(
                          title: otherNoteTitle,
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    TextFormFieldWidget(
                      hintText: '',
                      borderColor: AppColors.blackColor,
                      controller: noteController,
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.reportBtnColor),
                            ),
                            child: Signature(
                              height: 10.0.h,
                              width: 120.0.w,
                              controller: controller,
                              backgroundColor: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: AppColors.acceptSignColor,
                          child: const TextItemWidget(
                            title: submitTitle,
                            textColor: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                  ],
                ),
              ),
            ));
      });
    },
  ).then((value) {
    controller.clear();
  });
}

List<CrewChiefCheckModel> crewChiefCheckList = [
  CrewChiefCheckModel(title: 'Trash Removed From Vehicle'),
  CrewChiefCheckModel(title: 'Equipment Returned'),
  CrewChiefCheckModel(title: 'Evaluation Entered')
];

List<NoShowLateReturnModel> noShowLateReturnList = [
  NoShowLateReturnModel(title: 'Dontrell Bridges'),
  NoShowLateReturnModel(title: 'Davie Gray'),
  NoShowLateReturnModel(title: 'Kelvin Flowers')
];

class NoShowLateReturnModel {
  String title;
  bool isLate;
  bool isNoShow;

  NoShowLateReturnModel(
      {required this.title, this.isLate = false, this.isNoShow = false});
}

class CrewChiefCheckModel {
  String title;
  bool isChecked;
  CrewChiefCheckModel({required this.title, this.isChecked = false});
}
