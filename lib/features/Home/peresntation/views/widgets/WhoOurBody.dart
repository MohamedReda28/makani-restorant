import 'package:flutter/material.dart';
import 'package:makani/core/uitels/App_Color.dart';

class WhoOurBody extends StatelessWidget {
  const WhoOurBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(
            Icons.restaurant_menu,
            size: 60,
            color: AppColor.secondColor,
          ),
          const SizedBox(height: 16),
          const Text(
            'مرحبًا بك في مطعم مكاني 🍕🍔',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.kPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                textDirection: TextDirection.rtl,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'في مطعم مكاني، الأكل مش مجرد وجبة... ده لحظة من السعادة!\n\n'
                          'بنقدملك البيتزا الطازة المخبوزة بعناية، والكريبات المحشية بلمسة حب، والشاورما اللي ريحتها بتسبقها، والبرجر المميز، والبطاطس اللي بتقرمش في القلب قبل البق 😋.\n\n'
                          'إحنا في مكاني، بنؤمن إن كل وجبة لازم تكون طعمها ثابت وجودتها عالية، وعشان كده بنستخدم مكونات طازة ونجهز كل صنف بحرفية.\n\n'
                          'تقدر تطلب من خلال تطبيقنا بسهولة، وإحنا هنوصلك في أسرع وقت وبأعلى جودة. خليك دايمًا في مكاني، لأن هنا الأكل ليه طعم تاني 🔥❤️\n\n',
                    ),
                    TextSpan(
                      text: '📍 العنوان: الدقهلية - الكُردي - أمام قاعة الدبسي',
                      style: TextStyle(
                        color: AppColor.lightPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
