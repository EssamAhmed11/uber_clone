import 'package:flutter/material.dart';
import 'package:sweets/component/IngredientsBox.dart';
import 'package:sweets/models/product_model.dart';
import 'package:sweets/themeData.dart';
import 'package:sweets/utils/apiProvider.dart';

class ProductIngredients extends StatefulWidget {
  static const String id = 'product_ingredients';

  @override
  _ProductIngredientsState createState() => _ProductIngredientsState();
}

class _ProductIngredientsState extends State<ProductIngredients> {
  bool isLoading = true;

  List<ProductModel> productList;

  getProducts() async {
    productList = await ApiProvide().getProducts();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: kMainPurpleColorUsed,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, right: 18.0),
                        child: Text(
                          '10 عناصر',
                          style: kTitleWhiteTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: productList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListView(
                                scrollDirection: Axis.vertical,
                                children: <Widget>[
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '1 كوب دقيق ',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '½ كوب زيت ',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '½ كوب سكر',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '½ كوب تمر منزوع النوى',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '½ كوب لوز',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/mug.png'),
                                    textOfIngredients: '½ كوب عين جمل (جوز)',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/spoon.png'),
                                    textOfIngredients: '3 ملاعق بكينج باودر',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/spoon.png'),
                                    textOfIngredients: 'ملعقة هال ناعم',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/Shape.png'),
                                    textOfIngredients: '3 بيضات',
                                  ),
                                  IngredientsBox(
                                    imageOfIngredients:
                                        AssetImage('assets/images/spoon.png'),
                                    textOfIngredients: '1 ملعقة فانيليا',
                                  ),
                                ],
                              );
                            })),
                  ],
                ),
        ),
      ),
    );
  }
}
