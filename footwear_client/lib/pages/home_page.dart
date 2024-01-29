import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/controller/home_controller.dart';
import 'package:footwear_client/pages/login_page.dart';
import 'package:footwear_client/pages/product_description_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/drop_down_button.dart';
import '../widgets/multi_select_drop_down.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Footwear Store',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            actions: [IconButton(onPressed: () {
              GetStorage box = GetStorage();
              box.erase();
              Get.offAll(LoginPage());
            }, icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.productCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          ctrl.filterByCategory(ctrl.productCategory[index].name ?? '');
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Chip(
                              label: Text(ctrl.productCategory[index].name ?? 'Error'),
                            )),
                      );
                    }),
              ),
              Row(
                children: [
                  Flexible(
                    child: DropDownBtn(
                        items: ['Rs: Low to High', 'Rs: High to Low'],
                        selectedItemText: 'Sort',
                        onSelected: (selected) {
                          ctrl.sortByPrice(ascending: selected == 'Rs: Low to High' ? true : false);
                        }),
                  ),
                  Flexible(
                      child: MultiSelectDropDown(
                        items: ['Sketchers', 'Addidas', 'Puma', 'Clarks'],
                        onSelectionChanged: (selectedItems) {
                          // print(selectedItems);
                          ctrl.filterByBrand(selectedItems);
                        },
                      )),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 8),
                    itemCount: ctrl.productShowInUI.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productShowInUI[index].name ?? 'No name',
                        imageUrl: ctrl.productShowInUI[index].image ?? 'url',
                        price:  ctrl.productShowInUI[index].price ?? 00,
                        offerTag: '30% off',
                        onTap: () {
                          Get.to(ProductDescriptionPage(), arguments:{'data': ctrl.productShowInUI[index]});
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
