import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/appointment_model.dart';
import '../../../../models/doctor_model.dart';
import '../../../../models/payment_method.dart';
import '../../../../routes/app_routes.dart';
import '../models/appointment_type.dart';
import 'date_wheel_controller.dart';

class BookingController extends GetxController {
  late final String doctorId;

  final stepIndex = 0.obs;

  late final Rx<Appointment> appointment;

  final selectedPayment = Rxn<PaymentMethod>();

  final availableDates = <DateTime>[].obs;
  final availableTimes = <TimeOfDay>[].obs;
  final paymentMethods = <PaymentMethod>[].obs;

  final centeredDateIndex = 0.obs;
  late final PageController datePageController;

  final doctor = Rxn<Doctor>();

  late final DateWheelController wheel;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    doctorId = '1';

    doctor.value = Doctor(
      id: "1",
      name: "Dr Randy Wigham",
      specialty: "General",
      clinic: "RSUD Gatot Subroto",
      ratingAvg: 4.8,
      ratingCount: 4279,
      avatarUrl: null,
      about:
          "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. "
          "She achieved several awards for her wonderful contribution in medical field. "
          "She is available for private consultation.",
      workingTime: "Monday - Friday, 08.00 AM - 20.00 PM",
      strNumber: "4726482464",
      experiencePlace: "RSPAD Gatot Soebroto",
      experiencePeriod: "2017 - sekarang",
      locationText: "Cairo, Egypt",
      lat: 30.0444,
      lng: 31.2357,
    );

    appointment = Appointment(
      doctorId: doctorId,
      date: DateTime.now(),
      time: const TimeOfDay(hour: 8, minute: 0),
      appointmentTypeId: AppointmentType.inPerson.id,
    ).obs;

    _seed();

    centeredDateIndex.value = _findDateIndex(appointment.value.date);

    datePageController = PageController(
      initialPage: centeredDateIndex.value,
      viewportFraction: 1 / 5, // 5 عناصر
    );

    datePageController.addListener(_onDateWheelScroll);

    wheel = Get.put(
      DateWheelController(
        dates: availableDates,
        initialSelected: appointment.value.date,
        onChanged: selectDate, // ✅ سطر واحد وبس
      ),
      tag: 'booking_wheel',
    );

    loadPaymentMethods();
  }

  void _seed() {
    final now = DateTime.now();
    final base = DateTime(now.year, now.month, now.day);

    availableDates.assignAll(
      List.generate(60, (i) => base.add(Duration(days: i))),
    );

    availableTimes.assignAll(const [
      TimeOfDay(hour: 8, minute: 0),
      TimeOfDay(hour: 8, minute: 30),
      TimeOfDay(hour: 9, minute: 0),
      TimeOfDay(hour: 9, minute: 30),
      TimeOfDay(hour: 10, minute: 0),
      TimeOfDay(hour: 11, minute: 0),
    ]);

    /// dummy user payment methods (لاحقًا من API)
    paymentMethods.assignAll(const [
      PaymentMethod(
        id: 'pm_1',
        type: 'paypal',
        label: 'Paypal',
        last4: '3784',
        isDefault: true,
      ),
      PaymentMethod(id: 'pm_2', type: 'card', label: 'Visa', last4: '1122'),
    ]);

    selectedPayment.value = paymentMethods.firstWhereOrNull((e) => e.isDefault);
  }

  // -------- appointment Date & Time

  void setCenteredIndex(int i) {
    centeredDateIndex.value = i.clamp(0, availableDates.length - 1);
    selectDate(availableDates[centeredDateIndex.value]);
  }

  int _findDateIndex(DateTime d) {
    final idx = availableDates.indexWhere(
      (x) => x.year == d.year && x.month == d.month && x.day == d.day,
    );
    return idx == -1 ? 0 : idx;
  }

  void _onDateWheelScroll() {
    final p = datePageController.page;
    if (p == null) return;

    final idx = p.round().clamp(0, availableDates.length - 1);
    if (idx != centeredDateIndex.value) {
      setCenteredIndex(idx);
    }
  }

  void step(int delta) {
    final next = (centeredDateIndex.value + delta).clamp(
      0,
      availableDates.length - 1,
    );

    setCenteredIndex(next);

    datePageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  // -------- navigation
  void back() {
    if (stepIndex.value == 0) {
      Get.back();
      return;
    }
    stepIndex.value--;
  }

  void next() {
    if (stepIndex.value == 0 && appointment.value.time == null) return;
    if (stepIndex.value == 1 && selectedPayment.value == null) return;
    stepIndex.value++;
  }

  // -------- appointment updates (Rx)
  void selectDate(DateTime d) {
    appointment.value = appointment.value.copyWith(date: d);
  }

  void selectTime(TimeOfDay t) {
    appointment.value = appointment.value.copyWith(time: t);
  }

  void selectType(AppointmentType type) {
    appointment.value = appointment.value.copyWith(appointmentTypeId: type.id);
  }

  // -------- payment

  bool get canContinue {
    if (stepIndex.value == 0) return appointment.value.time != null;
    if (stepIndex.value == 1) return selectedPayment.value != null;
    return true;
  }

  final paymentLoading = false.obs;
  final paymentError = RxnString();

  /// UI category: card / bank / paypal
  final paymentCategory = 'card'.obs;

  List<PaymentMethod> get cardMethods =>
      paymentMethods.where((m) => m.type == 'card').toList();

  PaymentMethod? get paypalMethod =>
      paymentMethods.firstWhereOrNull((m) => m.type == 'paypal');

  PaymentMethod? get bankMethod =>
      paymentMethods.firstWhereOrNull((m) => m.type == 'bank');

  void selectPayment(PaymentMethod m) {
    selectedPayment.value = m;

    // keep category synced
    paymentCategory.value = m.type == 'card' ? 'card' : m.type;
  }

  /// لما المستخدم يضغط على "Credit Card" (مش كرت محدد)
  void selectCategory(String type) {
    paymentCategory.value = type;

    if (type == 'card') {
      // حافظي على الكرت الحالي إذا هو card، وإلا خذي default/أول كرت
      final current = selectedPayment.value;
      if (current != null && current.type == 'card') return;

      final def = paymentMethods.firstWhereOrNull(
        (m) => m.type == 'card' && m.isDefault,
      );
      final firstCard = cardMethods.isNotEmpty ? cardMethods.first : null;
      if (def != null)
        selectPayment(def);
      else if (firstCard != null) selectPayment(firstCard);
    } else if (type == 'paypal') {
      final p = paypalMethod;
      if (p != null) selectPayment(p);
    } else if (type == 'bank') {
      final b = bankMethod;
      if (b != null) selectPayment(b);
    }
  }

  Future<void> loadPaymentMethods() async {
    paymentLoading.value = true;
    paymentError.value = null;

    try {
      // TODO: بدلها بـ repository call
      // final list = await paymentRepo.getUserPaymentMethods(userId);

      // مؤقت: خليها نفس الدمي عندك أو رجعي list من service
      final list = <PaymentMethod>[
        const PaymentMethod(
          id: 'pm_1',
          type: 'card',
          label: 'Master Card',
          last4: '3784',
          isDefault: true,
        ),
        const PaymentMethod(
          id: 'pm_2',
          type: 'card',
          label: 'American Express',
          last4: '1122',
        ),
        const PaymentMethod(
          id: 'pm_3',
          type: 'card',
          label: 'Capital One',
          last4: '9033',
        ),
        const PaymentMethod(
          id: 'pm_4',
          type: 'card',
          label: 'Barclays',
          last4: '5566',
        ),
        const PaymentMethod(id: 'pm_5', type: 'paypal', label: 'Paypal'),
        const PaymentMethod(id: 'pm_6', type: 'bank', label: 'Bank Transfer'),
      ];

      paymentMethods.assignAll(list);

      final def = paymentMethods.firstWhereOrNull((m) => m.isDefault);
      selectedPayment.value = def ?? paymentMethods.firstOrNull;

      // category حسب المختار (card/bank/paypal)
      final t = selectedPayment.value?.type;
      paymentCategory.value =
          (t == 'card' || t == 'bank' || t == 'paypal') ? t! : 'card';
    } catch (e) {
      paymentError.value = e.toString();
    } finally {
      paymentLoading.value = false;
    }
  }

  void goToConfirm() {
    Get.toNamed(AppRoutes.bookingConfirmed);
  }

  void goBackAfterConfirmReschedule() {
    Get.back();
  }

  @override
  void onClose() {
    datePageController.removeListener(_onDateWheelScroll);
    datePageController.dispose();
    super.onClose();
  }
}
