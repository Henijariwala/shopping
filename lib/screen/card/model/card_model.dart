class cartModel{
  String?  product, qua , id , price;

  cartModel({this.id,this.price,this.product,this.qua});
  factory cartModel.mapToModel(Map m1)
  {
    return cartModel(
         product:m1['product'] ,price:m1['price'] ,qua:m1['qua']
    );
  }
}