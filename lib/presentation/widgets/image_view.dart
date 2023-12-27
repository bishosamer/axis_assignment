import 'package:axis_assignment/repositories/people_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatelessWidget {
  final List<String> imageUrls;
  final int startIndex;

  const ImageView(
      {super.key, required this.imageUrls, required this.startIndex});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: startIndex);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () async {
                if (controller.page != null) {
                  await context.read<PeopleRepository>().downloadImage(
                      'https://image.tmdb.org/t/p/original${imageUrls[controller.page!.toInt()]}');
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('downloaded successfully')));
                }
              },
              icon: const Icon(
                Icons.download,
                color: Colors.white,
              ))
        ],
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: PhotoViewGallery.builder(
        pageController: controller,
        itemCount: imageUrls.length,
        allowImplicitScrolling: true,
        enableRotation: true,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
                'https://image.tmdb.org/t/p/original${imageUrls[index]}'),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
          );
        },
      ),
    );
  }
}
