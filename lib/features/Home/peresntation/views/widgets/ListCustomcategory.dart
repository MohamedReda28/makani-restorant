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
          title: "برجر بيف",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'برجر بيف');
          }),
      CategortEntity(
          image: Assets.imagesBergerchick,
          title: "برجر تشكن",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'برجر تشكن');
          }),
      CategortEntity(
          image: Assets.imagesSandweches,
          title: "ساندوتشات",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'ساندوتشات');
          }),

      CategortEntity(
          image: Assets.imagesMashawe,
          title: "مشوبات بالوزن",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'مشوبات بالوزن');
          }),
      CategortEntity(
          image: Assets.imagesKereb,
          title: "كريبات",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'كريبات');
          }),
      CategortEntity(
          image: Assets.imagesWagpatrice,
          title: " وجبات ارز",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'وجبات ارز');
          }),
      CategortEntity(
          image: Assets.imagesPoteto,
          title: "المقبلات",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'المقبلات');
          }),

      CategortEntity(
          image: Assets.imagesSandwetsh,
          title: "ساندوتشات شاورما",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'ساندوتشات شاورما');
          }),
      CategortEntity(
          image: Assets.imagesPitzza,
          title: "بيتزا",
          onTap: () {
            context.read<ProductCubit>().getProductsByCatogry(catogry: 'بيتزا');
          }),
      CategortEntity(
          image: Assets.imagesSwane,
          title: "الصواني",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'الصواني');
          }),
      CategortEntity(
          image: Assets.imagesShawermawaz,
          title: "شاورما بالوزن",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'شاورما بالوزن');
          }),
      CategortEntity(
          image: Assets.imagesCola,
          title: "مشروبات",
          onTap: () {
            context
                .read<ProductCubit>()
                .getProductsByCatogry(catogry: 'مشروبات');
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
