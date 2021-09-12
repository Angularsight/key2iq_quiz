


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:key2iq_quiz/classes/main_screen_class.dart';
import 'package:key2iq_quiz/main_screen/staggered_grid_view_tile.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int _tabIndex = 0;


  @override
  Widget build(BuildContext context) {

    var listTile = MainScreenClass().listTile;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child:BottomNavigationBar(
            onTap: (index){
              setState(() {
                _tabIndex = index;
              });
            },
            showUnselectedLabels: true,
            currentIndex: _tabIndex,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(
              color: Colors.deepPurple
            ),
            items: [

              BottomNavigationBarItem(

                label: 'MENU',
                icon: Icon(Icons.toc_rounded,size: 30,),),
              BottomNavigationBarItem(
                label: 'COMPETE',
                icon: Icon(MaterialCommunityIcons.trophy_award,size: 30,),),
              BottomNavigationBarItem(
                label: 'EXPLORE',
                icon: Icon(MaterialIcons.explore,size: 30,),),
              BottomNavigationBarItem(
                label: 'FEEDBACK',
                icon: Icon(MaterialIcons.thumb_up,size: 30,),)
            ],
          )
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),


      body: Stack(

        children: [

          Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.90,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 6,
                  itemCount: 6,
                  staggeredTileBuilder: (int index)=>StaggeredTile.count(3, index.isEven?3.2:3.6),
                  mainAxisSpacing: 21,
                  crossAxisSpacing: 17,
                  itemBuilder: (context,index){
                    return StaggeredGridViewTile(
                      index: index,
                      title: listTile[index].title,
                      caption: listTile[index].caption,
                      icon:listTile[index].icon);
                  },
                ),
              )

            ),
          ),

          ),
          Positioned(
            top: 40,
            left: 35,
            child: Text('What do you want to do ...',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:25,

              ) ,),
          ),
        ],
      ),




      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        elevation: 5,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'COURSES',
            icon: Icon(Icons.house,size: 30,),
          ),
          BottomNavigationBarItem(
            label: 'COMMUNITY',
            icon: Icon(MaterialIcons.people_outline,size: 30,),
          ),
          BottomNavigationBarItem(
            label: 'PROFILE',
            icon: Icon(MaterialCommunityIcons.account_circle,size: 30,),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        elevation: 7,
        onPressed: (){},
        child: Icon(Feather.edit,color: Colors.black,),
      ),
    );
  }
}
