import 'package:get/get.dart';

class CalendarController extends GetxController {
  /// Reactive fields
  RxString selectedDay = "11".obs;
  RxString selectedMonth = "April".obs;
  RxString selectedYear = "2002".obs;

  /// Reactive lists
  RxList<String> daysList = <String>[].obs;

  final List<String> monthsList = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  final List<String> yearsList =
  List.generate(80, (i) => (DateTime.now().year - i).toString());

  @override
  void onInit() {
    super.onInit();
    updateDays(); // Fill list based on initial month/year
  }

  /// Updates days based on selected month + year (handles 28/29/30/31)
  void updateDays() {
    int monthIndex = monthsList.indexOf(selectedMonth.value) + 1;
    int year = int.parse(selectedYear.value);

    int daysInMonth = DateTime(year, monthIndex + 1, 0).day;

    daysList.value = List.generate(daysInMonth, (i) => (i + 1).toString());

    /// If previously selected day is out of range → reset
    if (int.parse(selectedDay.value) > daysInMonth) {
      selectedDay.value = "1";
    }
  }

  /// When month changes
  void changeMonth(String month) {
    selectedMonth.value = month;
    updateDays();
  }

  /// When year changes
  void changeYear(String year) {
    selectedYear.value = year;
    updateDays();
  }
}
