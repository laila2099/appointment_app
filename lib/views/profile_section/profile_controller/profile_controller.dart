import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/classes/api/api_result.dart';
import '../../../core/classes/api/api_result_guard.dart';
import '../../../core/classes/repositories/profile_repository.dart';
import '../../../models/user_profile_model.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;
  ProfileController({required this.repository});

  final loading = false.obs;
  final profile = Rxn<UserProfile>();
  Rx<File?> avatarFile = Rxn<File>();

  String? _accessToken;
  String? _userId;
  final _box = GetStorage();
  static const _avatarPathKey = 'avatar_path';

  @override
  void onInit() {
    super.onInit();
    _initProfile();
    _loadAvatar();
  }

  Future<void> _initProfile() async {
    await _loadAuthData();
    if (_accessToken != null && _userId != null) {
      getProfile();
    }
  }

  Future<void> _loadAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
    _userId = prefs.getString('user_id');
  }

  Future<void> getProfile() async {
    loading.value = true;

    final ApiResult<UserProfile> result = await repository.getProfile(
      accessToken: _accessToken!,
      userId: _userId!,
    );

    if (result is ApiSuccess<UserProfile>) {
      profile.value = result.data;
    } else if (result is ApiFailure<UserProfile>) {
      if (await result.guardUnauthorized()) return;
      Get.snackbar(
        'Error',
        result.error.message ?? 'Failed to load profile',
      );
    }

    loading.value = false;
  }

  Future<void> editProfile({
    String? fullName,
    String? email,
    String? phone,
    String? birthdate,
  }) async {
    loading.value = true;

    final ApiResult<UserProfile> result = await repository.editProfile(
      accessToken: _accessToken!,
      userId: _userId!,
      fullName: fullName,
      phone: phone,
      birthdate: birthdate,
      email: email,
    );

    if (result is ApiSuccess<UserProfile>) {
      profile.value = result.data;
      Get.snackbar('Success', 'Profile updated successfully');
    } else if (result is ApiFailure<UserProfile>) {
      Get.snackbar(
        'Error',
        result.error.message ?? 'Failed to update profile',
      );
    }

    loading.value = false;
  }

  void setAvatar(File file) {
    avatarFile.value = file;
    _box.write(_avatarPathKey, file.path);
  }

// تحميل الصورة من التخزين
  void _loadAvatar() {
    final path = _box.read(_avatarPathKey);
    if (path != null && File(path).existsSync()) {
      avatarFile.value = File(path);
    }
  }
}
