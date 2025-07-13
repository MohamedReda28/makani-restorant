import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Widghts/CustomTextField.dart';
import '../../../domines/entitys/Order_Entity.dart';
import 'Custom_Switch_Button.dart';

class AddressPageview extends StatelessWidget {
  const AddressPageview({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  labletext: 'الاسم كامل',
                  textInputType: TextInputType.name,
                  onSaved: (value) {
                    context.read<OrderInputEntity>().addressOrderentity.name =
                        value;
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  labletext: 'المدينه',
                  textInputType: TextInputType.name,
                  onSaved: (value) {
                    context.read<OrderInputEntity>().addressOrderentity.city =
                        value;
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  labletext: 'الحي',
                  textInputType: TextInputType.name,
                  onSaved: (value) {
                    context.read<OrderInputEntity>().addressOrderentity.address =
                        value;
                  }),
              const SizedBox(
                height: 8,
              ),

              CustomTextFormField(
                  labletext: 'رقم الهاتف',
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    context.read<OrderInputEntity>().addressOrderentity!.phone =
                        value;
                  }),
              const SizedBox(
                height: 16,
              ),
              // CustomSwitchButton(
              //   label: "حفظ العنوان",
              //   initialValue: false,
              //   onChanged: (value) {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
