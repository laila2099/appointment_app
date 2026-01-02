// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../../core/constants/app_routes.dart';
// import '../../../../core/services/shared_pref_service.dart';
//
// class AuthController extends GetxController {
//   static AuthController get instance => Get.find();
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Rx<User?> firebaseUser = Rx<User?>(null);
//   RxBool isLoggedIn = false.obs;
//   RxBool isLoading = false.obs;
//
//   User? get currentUser => _auth.currentUser;
//
//   @override
//   void onInit() {
//     super.onInit();
//     firebaseUser.bindStream(_auth.authStateChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }
//
//   void _setInitialScreen(User? user) {
//     if (user == null) {
//       isLoggedIn.value = false;
//       Get.offAllNamed(AppRoutes.login);
//     } else {
//       isLoggedIn.value = true;
//       Get.offAllNamed(AppRoutes.home);
//     }
//   }
//
//   /// إنشاء حساب جديد + حفظ البيانات
//   Future<void> signUp({
//     required String email,
//     required String password,
//     required String fullName,
//     required String commercialName,
//     required String commercialAccount,
//     String? storeLicensePath,
//   }) async {
//     try {
//       isLoading.value = true;
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );
//
//       final user = credential.user;
//       if (user == null) {
//         throw Exception("Failed to create user");
//       }
//       final fcmToken = await FirebaseMessaging.instance.getToken();
//       await _firestore.collection('Accounts').doc(user.uid).set({
//         'uid': user.uid,
//         'email': email.trim(),
//         'fullName': fullName.trim(),
//         'commercialName': commercialName.trim(),
//         'commercialAccount': commercialAccount.trim(),
//         'storeLicensePath': storeLicensePath ?? '',
//         'fcmToken': fcmToken ?? '',
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//       Get.snackbar("Success", "Account created successfully!");
//     } on FirebaseAuthException
//     // والا يرسل خطأ
//     catch (e) {
//       Get.snackbar("Error", e.message ?? "Firebase Auth Error");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
//   /// تسجيل الدخول
//   Future<void> login(String email, String password) async {
//     try {
//       isLoading.value = true;
//
//       // تسجيل الدخول باستخدام FirebaseAuth
//       UserCredential credential = await _auth.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );
//
//       final user = credential.user;
//       if (user == null) {
//         throw Exception("Failed to login");
//       }
//
//       //  التحقق أن المستخدم موجود في Firestore
//       final userDocRef = _firestore.collection('Accounts').doc(user.uid);
//       final docSnapshot = await userDocRef.get();
//
//       if (!docSnapshot.exists) {
//         // الحساب مسجل Auth فقط وليس له معلومات في Accounts
//         await _auth.signOut();
//
//         Get.snackbar(
//           "Error",
//           "This account is not among the registered users!\nPlease create an account first.",
//           snackPosition: SnackPosition.TOP,
//         );
//         return;
//       }
//       // موجود فعلاً → تحديث FCM وتسجيل الدخول
//       final fcmToken = await FirebaseMessaging.instance.getToken();
//       await userDocRef.update({
//         'fcmToken': fcmToken ?? '',
//         'lastLogin': FieldValue.serverTimestamp(),
//       });
//
//       isLoggedIn.value = true;
//       await SharedPrefService.saveLogin(email, password);
//
//       Get.offAllNamed(AppRoutes.home);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         Get.snackbar("Error", "There is no account with this email address.");
//       } else if (e.code == 'wrong-password') {
//         Get.snackbar("Error", "The password is incorrect.");
//       } else {
//         Get.snackbar("Error", e.message ?? "Error while logging in");
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// تسجيل الخروج
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//       isLoggedIn.value = false;
//       Get.offAllNamed(AppRoutes.login);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to sign out: $e");
//     }
//   }
// }
