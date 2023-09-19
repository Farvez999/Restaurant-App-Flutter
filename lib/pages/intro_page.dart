import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            // Shop Name
            Text(
              "BDCalling kitchen",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                color: Colors.white
              )
            ),

            const SizedBox(height: 25,),

            // Icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/salmon_egg.png'),),
            const SizedBox(height: 25,),

          // Title
            Text("THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 40,
                    color: Colors.white
                )),

            const SizedBox(height: 10),

          //   Sub Title
            Text(
                "Feel the taste of the most popular japanese food from anywhere in this country.",
            style: TextStyle(
              color: Colors.grey[300],
              height: 2
            ),),
            const SizedBox(height: 25),
            
          //   Get Start Button
            MyButton(
                text: "Get Started",
            onTap: (){
            //       go to menu page
              Navigator.pushNamed(context, '/menupage');
            },
            )
          ],
        ),
      ),
    );
  }
}
