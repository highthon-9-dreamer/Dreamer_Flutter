import 'package:dio/dio.dart';
import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/series/model/series_list_model.dart';
import 'package:dreamer_flutter/presentation/series/view/series_detail_screen.dart';
import 'package:dreamer_flutter/presentation/widget/series_item_widget.dart';
import 'package:dreamer_flutter/secret.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  Future<List<SeriesListModel>>? seriesList;

  Future<List<SeriesListModel>> getSeriesList() async {
    Dio dio = Dio();
    try {
      final resp = await dio.get(
        '$baseUrl/c/list',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      return (resp.data as List)
          .map((i) => SeriesListModel.fromJson(i))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    seriesList = getSeriesList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamerColor.g4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "내 서재",
                  style: TextStyle(
                    fontFamily: suit,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: seriesList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SeriesDetailScreen(index: index + 1, title: "내 서재"),
                            ),
                          );
                        },
                        child: SeriesItemWidget(
                          title: snapshot.data![index].title.toString(),
                          subTitle:
                          snapshot.data![index].seriesTitle.toString(),
                          index: index + 1,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('데이터가 없습니다.'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
