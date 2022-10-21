import 'package:flutter/material.dart';
import 'package:random_cat_facts/extension/context_extension.dart';
import 'package:random_cat_facts/presentation/widgets/image_with_loader.dart';

class CatImageWidget extends StatelessWidget {
  const CatImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catUrl = context.localizations.catImageUrl;
    final randomizer = DateTime.now().millisecondsSinceEpoch.toString();
    return ImageWithLoader(imageUrl: "$catUrl?$randomizer");
  }
}
