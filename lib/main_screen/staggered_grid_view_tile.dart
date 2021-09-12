


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key2iq_quiz/quiz_screen/questions.dart';
class StaggeredGridViewTile extends StatelessWidget {
  final int index;
  final String? title;
  final String? caption;
  final IconData icon;

  const StaggeredGridViewTile({Key? key,required this.index, this.title, this.caption,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(index==0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 gradient: LinearGradient(colors: [Color(0xff13254f),Colors.black])
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(icon,size: 100,color: Colors.white,),
                    Text(caption!,textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
