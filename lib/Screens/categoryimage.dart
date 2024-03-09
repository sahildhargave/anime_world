import 'package:anime_app/models/category.dart';
import 'package:anime_app/models/wallpaper.dart';
import 'package:anime_app/providers/get_data_provider.dart';
import 'package:anime_app/widgets/imgview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryImagePage extends StatefulWidget {
  final CategoryModel category;
  const CategoryImagePage({required this.category, super.key});

  @override
  State<CategoryImagePage> createState() => _CategoryImagePageState();
}

class _CategoryImagePageState extends State<CategoryImagePage> {
  final GetDataProvider dataProvider = GetDataProvider();

  List<WallpaperModel> images = [];
  @override
  void initState() {
    super.initState();
    fetchCategoryImages();
  }

  Future<void> fetchCategoryImages() async {
    dataProvider.fetchCategoryImages(widget.category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name!),
        ),
        body: Consumer<GetDataProvider>(builder: (context, provider, child) {
          final categoryImages = provider.animeData;

          if (categoryImages.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: categoryImages.length,
              itemBuilder: (context, index) {
                if (index == categoryImages.length - 1) {
                  fetchCategoryImages();
                } else {
                  const Center(child: CircularProgressIndicator());
                }
                final image = categoryImages[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageView(
                          imgUrl: image.imageUrl,
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: image.imageUrl,
                    fit: BoxFit.fill,
                  ),
                );
              });
        }));
  }
}
