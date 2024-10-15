import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping/screen/home/controller/home_controller.dart';
import 'package:shopping/utils/helper/db_helper.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.readQuery();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3895D3),
        foregroundColor: Colors.white,
        title: const Text("Card Screen"),
      ),
     body: Column(
       children: [
         Obx(
           () => Expanded(
             child: ListView.builder(
               itemCount: controller.list1.length,
               itemBuilder: (context, index) {
               return Container(
                 height: 200,
                 width: MediaQuery.sizeOf(context).width,
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
                           child: Text("${controller.list1[index].product}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("${controller.list1[index].qua}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("\$${controller.list1[index].price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         ),
                       ],
                     ),
                     const Spacer(),
                     Row(
                       children: [
                         IconButton(onPressed: () {
                           DBHelper.helper.delete(int.parse(controller.list1[index].id!));
                           controller.readQuery();
                         }, icon: const Icon(Icons.delete,color: Colors.blue,)),
                       ],
                     )
                   ],
                 ),
               );
             },),
           ),
         )
       ],
     ),
    );
  }
}
