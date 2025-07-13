import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../Home/peresntation/views/mainView.dart';
import '../../../domines/entitys/Order_Entity.dart';
import '../../../domines/entitys/paypal_payment_entity/paypal_payment_entity.dart';
import '../../maneger/addProductCubit/order_cubit.dart';
import 'CheckoutStepsListview.dart';
import 'CustombottonnavigationTapbar.dart';

class Checkout_View_Body extends StatefulWidget {
  const Checkout_View_Body({super.key});

  @override
  State<Checkout_View_Body> createState() => _Checkout_View_BodyState();
}

class _Checkout_View_BodyState extends State<Checkout_View_Body> {
  int currintindex = 0;
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifai =
      ValueNotifier(AutovalidateMode.disabled);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageActive = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifai.dispose();
    super.dispose();
  }

  int currentPageActive = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustombottonnavigationTapbar(
              pageController: pageController,
              currentPageActive: currentPageActive,
              ontap: (index) {
                var orderentity = context.read<OrderInputEntity>();
                if (index == 0) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else if (index == 1) {
                  if (orderentity.paywithCash != null) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    BuildSnakBar(context, 'اختار طريقه الدفع');
                  }
                } else {
                  addressSection_Validation();
                }
              }),
          Expanded(
            child: Checkout_Steps_Listview(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifai,
            ),
          ),
          CustomBotton(
              title: currentPageActive != 2 ? 'التالي' : "طلب",
              ontap: () {
                if (currentPageActive == 0) {
                  shippingSection_Validation(context);
                } else if (currentPageActive == 1) {
                  addressSection_Validation();
                } else {
                  var orderEntity = context.read<OrderInputEntity>();
                  context.read<AddOrderCubit>().addOrder(orderEntity);
                  Navigator.pushNamed(context,MainView.routeName );
                  //processpayment(context);
                }
              }),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void shippingSection_Validation(BuildContext context) {
    if (context.read<OrderInputEntity>().paywithCash != null) {
      pageController.animateToPage(currentPageActive + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      BuildSnakBar(context, 'اختار طريقه الدفع');
    }
  }

  void addressSection_Validation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(currentPageActive + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      valueNotifai.value = AutovalidateMode.always;
    }
  }

  void processpayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var ordercubit = context.read<AddOrderCubit>();
    log(paypalPaymentEntity.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context);
          ordercubit.addOrder(orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          BuildSnakBar(context, 'حدث خطأ في عمليه الدفع');
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
