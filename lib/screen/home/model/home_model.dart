class dbModel{
  String?  product, qua , id , price;

  dbModel({this.id,this.price,this.product,this.qua});
  factory dbModel.mapToModel(Map m1, String Docid)
  {
    return dbModel(id:Docid ,product:m1['product'] ,price:m1['price'] ,qua:m1['qua']);
  }
}