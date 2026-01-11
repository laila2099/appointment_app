import 'package:get/get.dart';

enum AppointmentType { inPerson, videoCall, phoneCall }

extension AppointmentTypeX on AppointmentType {
  String get id {
    switch (this) {
      case AppointmentType.inPerson:
        return 'in_person';
      case AppointmentType.videoCall:
        return 'video_call';
      case AppointmentType.phoneCall:
        return 'phone_call';
    }
  }

  String get label {
    switch (this) {
      case AppointmentType.inPerson:
        return 'appointment_type_in_person'.tr;
      case AppointmentType.videoCall:
        return 'appointment_type_video_call'.tr;
      case AppointmentType.phoneCall:
        return 'appointment_type_phone_call'.tr;
    }
  }

  static AppointmentType fromId(String id) {
    switch (id) {
      case 'video_call':
        return AppointmentType.videoCall;
      case 'phone_call':
        return AppointmentType.phoneCall;
      case 'in_person':
      default:
        return AppointmentType.inPerson;
    }
  }
}
