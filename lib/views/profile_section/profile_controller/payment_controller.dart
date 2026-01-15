import 'package:get/get.dart';

import '../../../core/constant/app_icons.dart';
import '../../../models/wallets_model.dart';

class PaymentController extends GetxController {
  final wallets = <WalletsModel>[
    WalletsModel(
      title: 'Paypal',
      icon: AppIcons.paypal,
      number: '**** **** **** 3784',
      isConnected: true,
    ),
    WalletsModel(
      title: 'Master Card',
      icon: AppIcons.masterCard,
      number: '**** **** **** 4428',
      isConnected: true,
    ),
    WalletsModel(
      title: 'Apple Pay',
      icon: AppIcons.applePay,
      number: '**** **** **** 3476',
      isConnected: true,
    ),
    WalletsModel(
      title: 'Payoneer',
      icon: AppIcons.payoneer,
      number: '**** **** **** 5764',
      isConnected: true,
    ),
    WalletsModel(
      title: 'Dana',
      icon: AppIcons.dana,
      number: '**** **** **** 10094',
      isConnected: true,
    ),
  ].obs;
}
