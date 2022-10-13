import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/sheard/sheard_componunts/navigate.dart';
import 'package:shop/sheard/sheard_network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/shop_login.dart';

class onBoardingScreen extends StatefulWidget {

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardController = PageController();
  bool isLast = true;

  List<BoardingModel> boarding = [
    BoardingModel(
      image: "assets/images/shop.png",
      title: "onBoard 1 Title ",
      body: "onBoard 1 Body "

    ),
    BoardingModel(
      image: "assets/images/shop.png",
      title: "onBoard 2 Title ",
      body: "onBoard 2 Body "

    ),
    BoardingModel(
      image: "assets/images/shop.png",
      title: "onBoard 3 Title ",
      body: "onBoard 3 Body "

    ),
  ];

  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value)
        {
          navigateFinish(context, ShopLogin());
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            navigateFinish(context, ShopLogin());
          }, child: Text("SKIP",style: TextStyle(fontSize: 15,color: Colors.deepOrange),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index){
                  if(index == boarding.length-1){
                    setState(() {
                      isLast = true;
                    });

                  }else
                    {
                      setState(() {
                        isLast = false;
                      });
                    }

                },
                physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>BuildBoardingItems(boarding[index]),
    itemCount: boarding.length,
    ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 4,
                    activeDotColor: Colors.deepOrange
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast)
                      {
                         submit();
                      }else
                        {
                          boardController.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn
                          );
                        }

                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

Widget BuildBoardingItems(BoardingModel model) => Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(child: Image(image: AssetImage("${model.image}"))),
SizedBox(height: 25,),
Text("${model.title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
SizedBox(height: 20,),
Text("${model.body}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
],
);


class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel( {required this.image,required this.title, required this.body,} );
}
