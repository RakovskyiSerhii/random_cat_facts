import 'package:flutter/material.dart';
import 'package:random_cat_facts/generated/assets/assets.gen.dart';

class ImageWithLoader extends StatelessWidget {
  const ImageWithLoader({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : Assets.lottie.catLoaderLurker.lottie();
        },
      ),
    );
  }
}
