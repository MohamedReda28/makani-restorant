import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Widghts/CustomTextField.dart';
import '../../../../../core/Widghts/dropdownTextFormField.dart';
import '../../../domines/entitys/Order_Entity.dart';

class AddressPageview extends StatefulWidget {
  const AddressPageview({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<AddressPageview> createState() => _AddressPageviewState();
}

class _AddressPageviewState extends State<AddressPageview> {
  bool delevry = false;
  late String methodOfReceipt;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.valueListenable,
        builder: (context, value, child) => Form(
          key: widget.formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              DropdownTextFormField(
                label: 'طريقة الاستلام',
                items: const [
                  'دليفري',
                  'استلام من المطعم',
                  'تناول داخل المطعم'
                ],
                onChanged: (val) {
                  methodOfReceipt = val;
                  context.read<OrderInputEntity>().methodOfReceipt = val;
                  if (val == 'دليفري') {
                    delevry = true;
                  } else {
                    delevry = false;
                    context
                        .read<OrderInputEntity>()
                        .addressOrderentity
                        .address = 'مطعم مكاني';
                    context.read<OrderInputEntity>().addressOrderentity.city =
                        '';
                  }
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Visibility(
                  visible: delevry, child: const AllTextFiledForAddresss()),
            ],
          ),
        ),
      ),
    );
  }
}

class AllTextFiledForAddresss extends StatelessWidget {
  const AllTextFiledForAddresss({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            labletext: 'الاسم كامل',
            textInputType: TextInputType.name,
            onSaved: (value) {
              context.read<OrderInputEntity>().addressOrderentity.name = value;
            }),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
            labletext: 'المدينه',
            textInputType: TextInputType.name,
            onSaved: (value) {
              context.read<OrderInputEntity>().addressOrderentity.city = value;
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
              context.read<OrderInputEntity>().addressOrderentity.phone = value;
            }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
