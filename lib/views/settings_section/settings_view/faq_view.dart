import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int expandedIndex = 0;

  final List<Map<String, String>> faqs = [
    {
      'q': "What should I expect during a doctor's appointment?",
      'a':
          "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
    },
    {
      'q': "What should I bring to my doctor's appointment?",
      'a': "Bring your ID, insurance card, medical records, and a list of medications."
    },
    {
      'q': "What if I need to cancel or reschedule my appointment?",
      'a': "You can cancel or reschedule by contacting the clinic in advance."
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
      'a': "Costs vary depending on provider and insurance coverage."
    },
    {
      'q': "What should I look for in a good doctor?",
      'a': "Experience, communication, and patient reviews are key factors."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'FAQ',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: faqs.length,
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
        ),
        itemBuilder: (context, index) {
          final isExpanded = expandedIndex == index;

          return InkWell(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? -1 : index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          faqs[index]['q']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  if (isExpanded) ...[
                    const SizedBox(height: 12),
                    Text(
                      faqs[index]['a']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
