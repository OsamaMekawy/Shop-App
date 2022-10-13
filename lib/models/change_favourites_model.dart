class ChangeFavouritemodel{
  late bool status;
  late String message;

  ChangeFavouritemodel.fromJson(Map<String,dynamic>json)
  {
    status = json['status'];
    message = json['message'];
  }


}