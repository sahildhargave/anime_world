import 'package:anime_app/Screens/categoryimage.dart';
import 'package:anime_app/models/category.dart';
import 'package:anime_app/providers/get_data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryCardState extends StatefulWidget {
  const CategoryCardState({super.key});

  @override
  State<CategoryCardState> createState() => _CategoryCardStateState();
}

class _CategoryCardStateState extends State<CategoryCardState> {
  final GetDataProvider dataProvider = GetDataProvider();
  List<CategoryModel> categoryData = [];

  late List<CategoryModel> categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final categories = await dataProvider.getCategory();
    setState(() {
      categoryData = categories;
    });
  }

  void _onCategoryTapped(CategoryModel category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryImagePage(category: category)));
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: categoryData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categoryData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final category = categoryData[index];
                return GestureDetector(
                    onTap: () => _onCategoryTapped(category),
                    child: Card(
                        child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.name!),
                        ],
                      ),
                    )));
              }),
    );
  }
}
