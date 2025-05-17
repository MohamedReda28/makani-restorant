import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import 'CustomFilterIem.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
     required this.contextt,
  });
  final BuildContext contextt;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int selectedIndex = 0;
  String sortOption = 'name_asc';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 30),
          Text(
            'ترتيب حسب :',
            textAlign: TextAlign.right,
            style: AppStyle.bold19,
          ),
          const SizedBox(height: 11),
          Customfilteriem(
            title: 'السعر ( الأقل الي الأعلي )',
            isselected: selectedIndex == 1,
            ontap: () {
              setState(() {
                sortOption = 'price_asc';
                selectedIndex = 1;
              });
            },
          ),
          const SizedBox(height: 11),
          Customfilteriem(
            title: 'السعر ( الأعلي الي الأقل )',
            isselected: selectedIndex == 2,
            ontap: () {
              setState(() {
                sortOption = 'price_desc';
                selectedIndex = 2;
              });
            },
          ),
          const SizedBox(height: 11),
          Customfilteriem(
            title: 'الأبجديه',
            isselected: selectedIndex == 3,
            ontap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: CustomBotton(
                title: 'تصفيه',
                ontap: () {
                  widget.contextt
                      .read<ProductCubit>()
                      .getProductsOrderBy(sortOption:sortOption);
                  Navigator.pop(context);
                }),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
