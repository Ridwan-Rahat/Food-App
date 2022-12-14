import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/screen/restaurant_screen.dart';
import 'package:untitled1/widgets/rating_stars.dart';
import 'package:untitled1/widgets/recent_order.dart';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    height: 140,
                    width: 150,
                    image: AssetImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                      Rating(
                          rating: restaurant.rating,
                        ),

                      const SizedBox(
                        height: 4.0,
                      ),Text(
                          restaurant.address,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                         overflow: TextOverflow.ellipsis,
                        ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_rounded),
          iconSize: 30.0,
        ),
        title: const Text("Food Delivery"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
            child: Text(
              "Cart(${currentUser.cart.length})",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          )
          // IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart)),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                fillColor: Colors.purple[50],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                      width: 0.5, color: Theme.of(context).primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                      width: 0.9, color: Theme.of(context).primaryColor),
                ),
                hintText: "Search Food Or Restaurant",
                prefixIcon: const Icon(
                  Icons.search,
                  size: 33,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  "Nearby Restaurant",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              buildRestaurant(),
            ],
          ),
        ],
      ),
    );
  }
}
