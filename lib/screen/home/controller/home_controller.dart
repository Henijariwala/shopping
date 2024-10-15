import 'dart:core';

import 'package:get/get.dart';
import 'package:shopping/screen/card/model/card_model.dart';
import 'package:shopping/screen/home/model/home_model.dart';
import 'package:shopping/utils/helper/db_helper.dart';
import 'package:shopping/utils/helper/firedb_helper.dart';

class HomeController extends GetxController{
  RxList<dbModel>list = <dbModel>[].obs;
  RxList<cartModel>list1 = <cartModel>[].obs;

  Future<void> readData() async {
    List<dbModel>data=await FireHelper.helper.readFire();
    list.value=data;
  }

  Future<void> readQuery() async {
    List<cartModel>query = await DBHelper.helper.readDb();
    list1.value = query;
    }
}