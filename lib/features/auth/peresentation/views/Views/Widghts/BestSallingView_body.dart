import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../constsns.dart';
import '../../../../../../core/Widghts/CustomAppbar2.dart';
import '../../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../Home/peresntation/views/widgets/ProductsGridviewBlocBuilder.dart';

class BestsallingviewBody extends StatefulWidget {
  const BestsallingviewBody({super.key});

  @override
  State<BestsallingviewBody> createState() => _BestsallingviewBodyState();

}

class _BestsallingviewBodyState extends State<BestsallingviewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getAllBestSellingProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kTopPadding,
              ),
              const CustomAppbar2(
                title: 'الأكثر مبيعًا',
              ),
              const SizedBox(height: 24),
              Text('الأكثر مبيعًا', style: AppStyle.bold16),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const ProductsGridviewBlocBuilder(),
      ]),
    );
  }
}
