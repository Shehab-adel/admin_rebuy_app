class DataModel {
  String? image;
  String? title;
  String? description;
  double? price;
  double? oldPrice;
  String? disccountPrecentage;
  List<double>? sizeList;

  DataModel(
      {this.image,
      this.description,
      this.title,
      this.oldPrice,
      this.price,
      this.disccountPrecentage,
      this.sizeList});

  DataModel.fromJson(Map<String, dynamic> json) {
    DataModel(
        image: json['image'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        oldPrice: json['old_price'],
        disccountPrecentage: json['disccountPrecentage'],
        sizeList: json['size_list']);
  }
}
