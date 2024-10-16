import'package:flutter/material.dart';
   class RecipeScreen extends StatefulWidget {

     const RecipeScreen({super.key});
     @override
     State<RecipeScreen> createState() => _RecipeScreenState();
   }
   
   class _RecipeScreenState extends State<RecipeScreen> {
     @override
     Widget build(BuildContext context) {
       return
         Scaffold(      backgroundColor:  Color(0xffe7e0d8),

             appBar: AppBar(
               backgroundColor: Color(0xffe7e0d8),
           ),

         body: Center(
           child:
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 width: 400,
                 height: 400,
                 margin: const EdgeInsets.all(10),
                 padding: const EdgeInsets.all(20),


                 decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                           color: Colors.blueGrey,
                           offset: const Offset(4.0, 4.0),
                           blurRadius: 15,
                           spreadRadius: 1.0
                       ),
                       const
                       BoxShadow(
                           color: Color(0xff79433d),
                           offset: const Offset(4.0, 4.0),
                           blurRadius: 15,
                           spreadRadius: 1.0
                       ),
                     ],

                     image: DecorationImage(
                       image: AssetImage("assets/images/about.jpg"),
                       fit: BoxFit.cover,
                     ),
                     borderRadius: BorderRadius.circular(12)
                 ),
               ),

             ],

           ),

         )
       );
     }
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   