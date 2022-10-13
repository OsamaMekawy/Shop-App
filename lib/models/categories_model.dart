class CategorriesModel{
  late bool status;
  late CategorriesDataModel data;

  CategorriesModel.fromJson(Map<String,dynamic>json){
    status = json['status'];
    data = CategorriesDataModel.fromJson(json['data']);

  }

}


class CategorriesDataModel{
  late int currentPage;
  late List<DataModel> data = [];


  CategorriesDataModel.fromJson(Map<String,dynamic>json){
    currentPage = json['current_page'];

    json['data'].forEach( (element){
      data.add(DataModel.fromJson(element));
    });

  }


}

class DataModel{
  late int id;
  late String name;
  late String image;

  DataModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    image = json['image'];

  }

}