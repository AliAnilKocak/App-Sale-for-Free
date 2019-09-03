class AppModel {
  String name;
  String icon;
  String link;
  String rating;
  String downloadCount;
  String priceNew;
  String priceOld;
  String priceDisco;

  AppModel(
    this.name,
    this.icon,
    this.link,
    this.rating,
    this.downloadCount,
    this.priceNew,
    this.priceOld,
    this.priceDisco,
  );

  AppModel.fromJson(Map json)
      : name = json['name'],
        icon = json['icon'],
        link = json['link'],
        rating = json['rating'],
        downloadCount = json['downloadCount'],
        priceNew = json['priceNew'],
        priceOld = json['priceOld'],
        priceDisco = json['priceDisco'];

  Map toJson() {
    return {
      'name': name,
      'icon': icon,
      'link': link,
      'rating': rating,
      'downloadCount': downloadCount,
      'priceNew': priceNew,
      'priceOld': priceOld,
      'priceDisco': priceDisco
    };
  }
}
