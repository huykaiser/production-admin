import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwear_admin/controller/home_controller.dart';
import 'package:footwear_admin/widgets/drop_down_btn.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add New Product',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: ctrl.productNameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Product Name'),
                          hintText: 'Enter Your Product Name'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productDescriptionCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Product Description'),
                          hintText: 'Enter Your Product Description'),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productImgCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Image Url'),
                          hintText: 'Enter Your Image Url'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productPriceCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Product Price'),
                          hintText: 'Enter Your Product Price'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                            child: DropDownBtn(
                              items: const ['Boots', 'Shoe', 'Beach Shoes', 'High heels'],
                              selectedItemText: ctrl.category,
                              onSelected: (selectedValue) {
                                ctrl.category = selectedValue ?? 'general';
                                ctrl.update();
                              },
                            )),
                        Flexible(
                            child: DropDownBtn(
                              items: const ['Puma', 'Sketchers', 'Addidas', 'Clarks'],
                              selectedItemText: ctrl.brand,
                              onSelected: (selectedValue) {
                                ctrl.brand = selectedValue ?? 'general';
                                ctrl.update();
                              },
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Offer Product ?'),
                    DropDownBtn(
                      items: const ['true', 'false'],
                      selectedItemText: ctrl.offer.toString(),
                      onSelected: (selectedValue) {
                        ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                        ctrl.update();
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          ctrl.addProduct();
                        },
                        child: Text('Add Product'))
                  ],
                ))),
      );
    });
  }
}
