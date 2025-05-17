import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../domines/entites/CatogryEntity.dart';
import 'CustomCategory.dart';

class ListCustomcategory extends StatelessWidget {
  const ListCustomcategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategortEntity> categories = [
      CategortEntity(
          image: Assets.imagesBerger,
          title: "برجر",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'berger');
          }),
      CategortEntity(
          image: Assets.imagesPitzza,
          title: "بيتزا",
          onTap: () {
            context.read<ProductCubit>().getProductsByCatogry(catogry: 'pizza');
          }),
      CategortEntity(
          image: Assets.imagesChicken,
          title: "فراخ",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'chiken');
          }),
      CategortEntity(
          image: Assets.imagesKereb,
          title: "كريبات",
          onTap: () {
            context.read<ProductCubit>().getProductsByCatogry(catogry: 'kereb');
          }),
      CategortEntity(
          image: Assets.imagesCola,
          title: "مشروبات",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'drinking');
          }),
      CategortEntity(
          image: Assets.imagesPoteto,
          title: "بطاطس",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'potetos');
          }),
      CategortEntity(
          image: Assets.imagesSandwetsh,
          title: "ساندوتش",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'sandwetsh');
          }),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) =>
                Customcategory(categortEntity: category, onTap: category.onTap))
            .toList(),
      ),
    );
  }
}
