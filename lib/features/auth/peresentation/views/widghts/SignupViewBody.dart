import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/Custom Password Feild.dart';
import '../../../../../core/Widghts/CustomTextField.dart';
import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../cubits/SignUp_Cubite/signup_cubit_cubit.dart';
import 'Dont Have Account Widgh.dart';
import 'Terms And Condetion.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool change = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                  height: 230,
                  child: Image.asset(Assets.imagesLogo)),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                labletext:  "الاسم بالكامل",
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
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
                height: 16,
              ),
              TermsAndCondetion(
                changed: (value) {
                  change = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBotton(
                title: "انشاء حساب جديد",
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (change) {
                      context
                          .read<SignupCubit>()
                          .CreateUserWithEmailAndPassword(
                              email, password, name);
                    } else {
                      BuildSnakBar(context, 'يجب الموافقه علي الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 26,
              ),
              FittedBox(
                child: DontHaveAccountWidgh(
                  textone:"تمتلك حساب بالفعل؟",
                  texttwo: "قم بتسجيل الدخول",
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
