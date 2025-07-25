
import '../../../../core/uitels/app_images.dart';

class BottonNavigtionarEntite {
  final String activeImage, InActiveImsge;
  final String name;

  BottonNavigtionarEntite(
      {required this.activeImage,
      required this.InActiveImsge,
      required this.name});
}

List<BottonNavigtionarEntite> bottomNavigtionarEntites = [
  BottonNavigtionarEntite(
    InActiveImsge: Assets.imagesHome,
    activeImage: Assets.imagesHomeActive,
    name: 'الرئسية',
  ),
  BottonNavigtionarEntite(
    InActiveImsge: Assets.imagesElement3,
    activeImage: Assets.imagesElementActive3,
    name: 'المنتجات',
  ),
  BottonNavigtionarEntite(
    InActiveImsge: Assets.imagesShoppingCart,
    activeImage: Assets.imagesShoppingCartActive,
    name: 'السلة',
  ),
  BottonNavigtionarEntite(
    InActiveImsge: Assets.imagesUser,
    activeImage: Assets.imagesUserActive,
    name: 'حسابي',
  ),
];
