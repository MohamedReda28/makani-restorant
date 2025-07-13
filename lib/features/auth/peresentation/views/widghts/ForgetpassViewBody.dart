import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomTextField.dart';
import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../cubits/Forgetpass_Cubit/forgetpass_cubit.dart';

class ForgetpassViewBody extends StatefulWidget {
  ForgetpassViewBody({super.key});

  @override
  State<ForgetpassViewBody> createState() => _ForgetpassViewBodyState();
}

class _ForgetpassViewBodyState extends State<ForgetpassViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              "لا تقلق ، ما عليك سوى كتابة البريد الإلكتروني وسنرسل رسالة التحقق.",
              textAlign: TextAlign.right,
              style: AppStyle.semibold16.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              labletext: "الايميل",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomBotton(
              title: "نسيت كلمه المرور",
              ontap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context
                      .read<ForgetpassCubit>()
                      .sendPasswordResetEmail(email: email);
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
