import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<String> serviceTypeValue = ''.obs;
  Rx<String> dateTime = DateFormat('MM/dd/yy').format(DateTime.now()).obs;
}
