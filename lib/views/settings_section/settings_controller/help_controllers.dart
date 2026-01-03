import 'package:get/get.dart';

class HelpController extends GetxController {
  
  final expandedIndex = (-1).obs;

  final faqs = const [
    {
      'q': "What should I expect during a doctor's appointment?",
      'a':
          "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
    },
    {
      'q': "What should I bring to my doctor's appointment?",
      'a':
          "Bring your ID, insurance card, medical records, and a list of medications."
    },
    {
      'q': "What if I need to cancel or reschedule my appointment?",
      'a':
          "You can cancel or reschedule by contacting the clinic in advance."
    },
    {
      'q': "How do I make an appointment with a doctor?",
      'a': "Appointments can be made online or by calling the clinic."
    },
    {
      'q': "How early should I arrive for my doctor's appointment?",
      'a': "Arrive 10–15 minutes early for paperwork and check-in."
    },
    {
      'q': "How long will my doctor's appointment take?",
      'a': "Most appointments last between 15 and 30 minutes."
    },
    {
      'q': "How much will my doctor's appointment cost?",
      'a':
          "Costs vary depending on provider and insurance coverage."
    },
    {
      'q': "What should I look for in a good doctor?",
      'a':
          "Experience, communication, and patient reviews are key factors."
    },
  ];

  void toggle(int index) {
    expandedIndex.value =
        expandedIndex.value == index ? -1 : index;
  }
}
