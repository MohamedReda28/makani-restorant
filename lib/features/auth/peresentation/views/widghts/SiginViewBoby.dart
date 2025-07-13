import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              SizedBox(height: 230, child: Image.asset(Assets.imagesLogo)),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                labletext: "الايميل",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetpassView.routeName);
                    },
                    child: Text(
                      "هل نسيت كلمه المرور؟",
                      style: AppStyle.semibold13
                          .copyWith(color: AppColor.lightPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Center(
                child: CustomBotton(
                  title: "تسجيل الدخول",
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
              const SizedBox(
                height: 33,
              ),
              DontHaveAccountWidgh(
                textone: "لا تمتلك حساب",
                texttwo: "قم بانشاء حساب جديد",
                ontap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              ),
              const SizedBox(
                height: 33,
              ),
              const CustomDriverAndOr(),
              const SizedBox(
                height: 16,
              ),
              CustomLoginBy(
                ontap: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                title: "تسجيل الدخول بواسطه جوجل",
                image: Assets.imagesGoogleIcons,
              ),
              const SizedBox(
                height: 16,
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
              const SizedBox(
                height: 16,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
