import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/screen/card/model/card_model.dart';
import 'package:shopping/screen/home/controller/home_controller.dart';
import 'package:shopping/screen/home/model/home_model.dart';
import 'package:shopping/utils/helper/db_helper.dart';
import 'package:shopping/utils/helper/firedb_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtQuality = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3895D3),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Home Screen"),
        actions: [
          IconButton(onPressed: () {
            Get.toNamed('card');

          }, icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Obx(
            () =>  Expanded(
              child: ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${controller.list[index].product}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${controller.list[index].qua}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("\$${controller.list[index].price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),

                              // const SizedBox(height: 20,),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(onPressed: () {
                                FireHelper.helper.delete(controller.list[index].id!);
                                controller.readData();
                              }, icon: const Icon(Icons.delete,color: Colors.blue,)),
                              IconButton(onPressed: () {
                                txtProduct.text = controller.list[index].product!;
                                txtPrice.text = controller.list[index].price!;
                                txtQuality.text = controller.list[index].qua!;
                                Get.defaultDialog(
                                  title: "Are u sure to update",
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        controller: txtProduct,
                                        validator: (value) {
                                          if(value!.isEmpty){
                                            return "Enter the product";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Product"
                                        ),
                                      ),
                                      TextFormField(
                                        controller: txtQuality,
                                        validator: (value) {
                                          if(value!.isEmpty){
                                            return "Enter the Quantity";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Quantity"
                                        ),
                                      ),
                                      TextFormField(
                                        controller: txtPrice,
                                        validator: (value) {
                                          if(value!.isEmpty){
                                            return "Enter the price";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Price"
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(onPressed: () {
                                      String product = txtProduct.text;
                                      String qua = txtQuality.text;
                                      String price = txtPrice.text;
                                      dbModel model = dbModel(
                                        qua: qua,
                                        product: product,
                                        price: price,
                                        id: controller.list[index].id
                                      );
                                      FireHelper.helper.update(model);
                                      controller.readData();
                                      txtPrice.clear();
                                      txtQuality.clear();
                                      txtProduct.clear();
                                      Get.back();
                                    }, child: const Text("Update")),
                                    ElevatedButton(onPressed: () {
                                      Get.back();
                                    }, child: const Text("Cancel"))
                                  ]
                                );
                              }, icon: const Icon(Icons.update,color: Colors.blue,)),
                              IconButton(onPressed: () {
                                dbModel m1 = dbModel(
                                  price: controller.list[index].price,
                                  product: controller.list[index].product,
                                  qua: controller.list[index].qua,
                                );
                                DBHelper.helper.insertDb(m1);
                                controller.readQuery();
                                Get.snackbar("Successfully", "Shopping");
                              }, icon: const Icon(Icons.add_card,color: Colors.green,)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
              },),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.defaultDialog(
          title: "Add Product",
          content: Form(
            key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: txtProduct,
                    decoration: const InputDecoration(
                      hintText: "Product",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Enter the product";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: txtQuality,
                    decoration: const InputDecoration(
                      hintText: "Quantity",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Enter the product";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: txtPrice,
                    decoration: const InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Enter the Price";
                      }
                      return null;
                    },
                  ),

                ],
              )
          ),
            actions: [
              ElevatedButton(onPressed: () {
                if(formKey.currentState!.validate()){
                  dbModel d1 = dbModel(
                      price: txtPrice.text,
                      product: txtProduct.text,
                      qua: txtQuality.text
                  );
                  FireHelper.helper.add(d1);
                  controller.readData();
                  txtQuality.clear();
                  txtPrice.clear();
                  txtProduct.clear();
                  Get.back();
                  Get.snackbar("Successfully", "Shopping");
                }

              },style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff3895D3)),
                foregroundColor: WidgetStatePropertyAll(Colors.white)
              ), child: const Text("Submit"),),
              ElevatedButton(onPressed: () {
                Get.back();
              },style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xff3895D3)),
                foregroundColor: WidgetStatePropertyAll(Colors.white)
              ), child: const Text("Cancel"),
              )
            ]
        );
        // Get.toNamed('card');
      },
        backgroundColor: const Color(0xff3895D3),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),),
    );
  }
}
