import 'package:anime_app/providers/get_data_provider.dart';
import 'package:anime_app/widgets/bottom_nav.dart';
import 'package:anime_app/widgets/imgview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load initial data
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.fetchInitialData();
    _scrollController.addListener(() {
      if (!isLoading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        // User has reached the end of the list, load more data
        dataProvider.fetchInitialData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context);
    return Scaffold(
      body: dataProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          /*MasonryGridView.count(
          controller: _scrollController ,
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          itemCount: 100,
            
            itemBuilder: (context, index ) {
              return loadingShimmer();
            }
      )
      */
          : MasonryGridView.count(
              controller: _scrollController,
              crossAxisCount: 4,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              itemCount: isLoading
                  ? dataProvider.animeData.length + 1
                  : dataProvider.animeData.length,
              itemBuilder: (BuildContext context, int index) {
                if (index >= 0 && index < dataProvider.animeData.length) {
                  // The index is within the valid range of indices
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageView(
                              imgUrl: dataProvider.animeData[index].imageUrl,
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: dataProvider.animeData[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else {
                  // Show a loading indicator while loading more data
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
      //bottomNavigationBar: BottoNavBar(),
    );
  }
}
