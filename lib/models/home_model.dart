class HomeModel{
  late bool status;
  late HomeModelData data;

  HomeModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = HomeModelData.fromJson(json['data']);
  }

}

class HomeModelData{
  List<BannerModel>banners = [];
  List<ProductModel>product= [];


  HomeModelData.fromJson(Map<String,dynamic> json)
  {
     json['banners'].forEach((element){
       banners.add(element);
     });
  }

}

class BannerModel{
 late int id;
  late String image;
  BannerModel.fromJson(Map<String,dynamic> json)
  {

    id = json['id'];
    image = json['image'];


  }


}
class ProductModel{
late int id;
late dynamic price;
late dynamic oldPrice;
late dynamic discount;
late String image;
late String name;
late bool inFavorite;
late bool inCart;
  ProductModel.fromJson(Map<String,dynamic> json)
  {
     id = json['id'];
     price = json['price'];
     oldPrice = json['old_price'];
     discount = json['discount'];
     image = json['image'];
     name = json['name'];
     inFavorite = json['in_favorites'];
     inCart = json['in_cart'];
  }


}

