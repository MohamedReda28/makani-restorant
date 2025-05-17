import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/Custom Password Feild.dart';
import '../../../../../core/Widghts/CustomTextField.dart';
import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../cubits/Signin_Cubit/cubit/signin_cubit.dart';
import '../ForgetPass.dart';
import '../SignupView.dart';
import 'Custom Driver And Text.dart';
import 'Dont Have Account Widgh.dart';
import 'SocailLogin By.dart';

class SiginVeiwBody extends StatefulWidget {
  const SiginVeiwBody({super.key});

  @override
  State<SiginVeiwBody> createState() => _SiginVeiwBodyState();
}

class _SiginVeiwBodyState extends State<SiginVeiwBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hinttext: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomPasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, ForgetpassView.routeName);
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppStyle.semibold13
                          .copyWith(color: AppColor.lightPrimaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              Center(
                child: CustomBotton(
                  title: 'تسجيل دخول',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SigninCubit>()
                          .SignWithEmailAndoPassword(email, password);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              DontHaveAccountWidgh(
                textone: 'لا تمتلك حساب؟',
                texttwo: 'قم نانشاء حساب',
                ontap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              ),
              SizedBox(
                height: 33.h,
              ),
              const CustomDriverAndOr(),
              SizedBox(
                height: 16.h,
              ),
              CustomLoginBy(
                ontap: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcons,
              ),
              SizedBox(
                height: 16.h,
              ),
              // CustomLoginBy(
              //   ontap: () {},
              //   title: 'تسجيل بواسطة أبل',
              //   image: Assets.imagesAppleIcons,
              // ),
              // SizedBox(
              //   height: 16.h,
              // ),
              // CustomLoginBy(
              //   ontap: () {
              //     context.read<SigninCubit>().signInWithFacebook();
              //   },
              //   title: 'تسجيل بواسطة فيسبوك',
              //   image: Assets.imagesFaceBookIcons,
              // ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
