import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:get/get.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    notifications.assignAll([
      NotificationModel(
        title: 'Appointment Success',
        message:
            "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
        time: '1h',
        icon: AppIcons.calendarTick,
        circle: AppColors.greencircle,
        section: NotificationSection.today,
      ),
      NotificationModel(
        title: 'Schedule Changed',
        message:
            "You have successfully changed your appointment with Dr. Randy Wigham. Don’t forget to active your reminder.",
        time: '5h',
        icon: AppIcons.calendar_2,
        circle: AppColors.bluecircle,
        isActive: true,
        section: NotificationSection.today,
      ),
      NotificationModel(
        title: 'Video Call Appointment',
        message:
            "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
        time: '7h',
        icon: AppIcons.video,
        circle: AppColors.greencircle,
        section: NotificationSection.today,
      ),
      NotificationModel(
        title: 'Appointment Cancelled',
        message:
            "You have successfully canceled your appointment with Dr. Randy Wigham. 50% of the funds will be returned to your account.",
        time: '1d',
        icon: AppIcons.calendarRemove,
        circle: AppColors.redcircle,
        section: NotificationSection.yesterday,
      ),
      NotificationModel(
        title: 'New Payment Added!',
        message: "Your payment has been successfully linked with Docdoc.",
        time: '1d',
        icon: AppIcons.wallet,
        circle: AppColors.bluecircle,
        isActive: true,
        section: NotificationSection.yesterday,
      ),
    ]);
  }

  // ===== Getters =====
  List<NotificationModel> get todayNotifications => notifications
      .where((e) => e.section == NotificationSection.today)
      .toList();

  List<NotificationModel> get yesterdayNotifications => notifications
      .where((e) => e.section == NotificationSection.yesterday)
      .toList();

  int get unreadCount => notifications.where((e) => e.isActive).length;

  // ===== Actions =====
  void markAsRead(NotificationModel notification) {
    notification.isActive = false;
    notifications.refresh();
  }

  void markAllAsRead() {
    for (final n in notifications) {
      n.isActive = false;
    }
    notifications.refresh();
  }
}
