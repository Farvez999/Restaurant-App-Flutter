import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  // quantity
  int quantityCount =0;

  // decrement Quantity
  void decrementQuantity(){
    setState(() {
      if(quantityCount >0 ){
        quantityCount--;
      }
    });
  }

  void addToCart(){
  // Only add to cart if there is something in the cart
    if(quantityCount > 0){
    //   get access to shop
      final shop = context.read<Shop>();

    //   add to cart
      shop.addToCart(widget.food, quantityCount);
      
      
    //   let the user know it was successfull
      showDialog(
        context: context,

          barrierDismissible: false,

          builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
            content: const Text("Successfully added to cart", style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
            actions: [
            //   Okay button
              IconButton(onPressed: (){
              //   pop once to remove dialog box
                Navigator.pop(context);

              //   pop again to go previous screen
                Navigator.pop(context);


              }, icon: const Icon(Icons.done, color: Colors.white,))
            ],
          ),
      );
    }
  }

  // increment Quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),

      body: Column(
        children: [
        //   Listview of food details
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
              //   Image
                Image.asset(widget.food.imagePath, height: 200,),

                const SizedBox(height: 25,),

              //   rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),

                    const SizedBox(width: 5,),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10,),

              //   food name
                Text(
                    widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),

                const SizedBox(height: 25,),

              //   Description
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),

                const SizedBox(height: 10,),

                Text(
                  "Flutter is Google’s Mobile SDK to build native iOS and Android apps from a single codebase. It was developed on December 4, 2018. When building applications with Flutter, everything is towards Widgets – the blocks with which the Flutter apps are built. The User Interface of the app comprises many simple widgets, each handling one particular job. That is why Flutter developers tend to think of their Flutter app as a tree of devices.",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2
                  ),
                ),

              ],
            ),
          )),

        //   Price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
              //   Price + Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //   Price
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),

                  //   Quantity
                    Row(children: [
                    //   minus button
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon:const Icon(
                              Icons.remove,
                          color: Colors.white,),
                          onPressed: decrementQuantity,
                        ),
                      ),

                    //   quantity count
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),
                        ),
                      ),

                      
                    //   plus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon:const Icon(
                            Icons.add,
                            color: Colors.white,),
                          onPressed: incrementQuantity,
                        ),
                      )
                    ],)
                  ],
                ),

              const SizedBox(height: 15,),
              //   add to cart button
                MyButton(text: "Add To Cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
