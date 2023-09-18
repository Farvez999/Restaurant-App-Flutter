import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/components/food_tile.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/pages/food_details_page.dart';
import 'package:restaurant_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  // food List
  List foodMenu = [

    Food(name: "Salmon Sushi", price: "21.0", imagePath: "lib/images/salmon_sushi.png", rating: "5"),

    Food(name: "Tuna", price: "20.0", imagePath: "lib/images/tuna.png", rating: "4.5")

  ];

  void navigateToFoodDetails(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900]
        ),
        title: Text('Tokyo', style: TextStyle(color: Colors.grey[900]),),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //   Promo Banner
          Container(
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //   Promo Message
                    Text("Get 32% Promo",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white
                    ),),

                    const SizedBox(height: 20,),

                    MyButton(
                        text: "Redeem", onTap: (){}
                    )
                  ],
                ),
                
              //   Image
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,)
              ],
            ),
          ),

        const SizedBox(height: 25,),

        //   Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Search here..."
            ),
          ),
          ),

        const SizedBox(height: 25,),


        //   Menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
                "Food Menu",
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18
            ),
            ),
          ),

          SizedBox(height: 10,),

        Expanded(child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodMenu.length,
          itemBuilder: (context, index) => FoodTile(
          food: foodMenu[index],
            onTap: ()=> navigateToFoodDetails(index),
        ),)
        ),

        SizedBox(height: 25,),

        //   Polular Food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Image
                    Image.asset(
                      'lib/images/salmon_egg.png',
                      height: 60,
                    ),

                    //   Name and Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10,),

                        //   Price
                        Text(
                          '\$21.00',
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        )
                      ],
                    )
                  ],
                ),

                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
