import 'package:dio/dio.dart';
import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/series/model/series_list_model.dart';
import 'package:dreamer_flutter/presentation/series/view/series_detail_screen.dart';
import 'package:dreamer_flutter/presentation/widget/series_item_widget.dart';
import 'package:dreamer_flutter/secret.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeriesMainScreen extends ConsumerStatefulWidget {
  const SeriesMainScreen({super.key});

  @override
  ConsumerState<SeriesMainScreen> createState() => _SeriesMainScreenState();
}

class _SeriesMainScreenState extends ConsumerState<SeriesMainScreen> {
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
      backgroundColor: DreamerColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    '연재 중',
                    style: TextStyle(
                      color: DreamerColor.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                                      SeriesDetailScreen(index: index + 1),
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
        ),
      ),
    );
  }
}
