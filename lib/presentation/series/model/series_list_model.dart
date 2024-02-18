class SeriesListModel {
  String? title;
  String? seriesTitle;
  int? number;

  SeriesListModel({this.title, this.seriesTitle, this.number});

  SeriesListModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    seriesTitle = json['SeriesTitle'];
    number = json['Number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['SeriesTitle'] = seriesTitle;
    data['Number'] = number;
    return data;
  }
}
