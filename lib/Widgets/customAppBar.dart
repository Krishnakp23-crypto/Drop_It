import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget
{
  final PreferredSizeWidget bottom;
  MyAppBar({this.bottom});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF5C4057)
      ),
      flexibleSpace: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
             colors: [Color(0xFFFDBE3B)],
             begin: const FractionalOffset(0.0, 0.0),
             end: const FractionalOffset(1.0,0.0),
             stops: [0.0, 1.0],
             tileMode: TileMode.clamp,
          ),
        ),
      ),
        centerTitle: true,
        title: Text(
          "DROP IT",
          style: TextStyle(fontSize: 55.0, color:Color(0xFF5C4057), fontFamily: "Signatra" ),

        ),
        bottom: bottom,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart,color: Colors.pink,), 
                onPressed:()
                {
                  Route route = MaterialPageRoute(builder: (c) => CartPage());
                  Navigator.pushReplacement(context, route);
                },
             ),
             Positioned(
               child: Stack(
                 children: [
                   Icon(
                     Icons.brightness_1,
                     size: 20.0,
                      color: Colors.green,
                    ),
                    Positioned(
                      top: 3.0,
                      bottom: 4.0,
                      left: 4.0 ,
                      child: Consumer<CartItemCounter>(
                        builder: (context,counter, _)
                        {
                           return Text(
                            (DropItApp.sharedPreferences.getStringList(DropItApp.userCartList).length-1).toString(),
                             style: TextStyle(color: Color(0xFF5C4057), fontSize: 12.0,fontWeight: FontWeight.w500),
                           );
                        },
                      ),
                    ),
                  ],
               ),
              ),
            ],
          ),
        ],
    );

  }


  Size get preferredSize => bottom==null?Size(56,AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);
}
