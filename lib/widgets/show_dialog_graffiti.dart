import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/const_strings.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

showDialogReportGraffiti(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
                child: TextItemWidget(
                    title: reportGraffitiTitle, fontSize: 8.0.sp)),
            content: SizedBox(
              width: double.maxFinite,
              child: DataTable(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.3.w,
                          color: AppColors.reportGraffitiLineColor)),
                  border:
                      TableBorder.all(color: AppColors.reportGraffitiLineColor),
                  columns: [
                    DataColumn(
                      label: Center(
                        child: TextItemWidget(
                            title: locationTitle, fontSize: 6.0.sp),
                      ),
                    ),
                    DataColumn(
                      label: Center(
                        child: TextItemWidget(
                            title: refNumberTitle, fontSize: 6.0.sp),
                      ),
                    ),
                  ],
                  rows: List.generate(9, (index) {
                    return DataRow(
                      cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ],
                    );
                  })),
            ));
      });
}
