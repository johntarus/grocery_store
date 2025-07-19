import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context){
        return CartPage();
      })),
      child: Icon(Icons.shopping_cart)),
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Good morning,"),
          ),
          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

         const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(thickness: 4,),
          ),

          const SizedBox(height: 24),
          
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Fresh Items", style: TextStyle(fontSize: 16),),
          ),

          Expanded(
              child: Consumer<CartModel>(builder:
              (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index){
                      return GroceryItemTile(itemName:
                        value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1].toString(),
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                      onPressed: () {
                          // value.addToCart(value.shopItems[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${value.shopItems[index][0]} added to cart"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        });

                    });
              })
          )
        ],
      )),
    );
  }
}
