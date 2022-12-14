
import 'package:flutter/material.dart';

import 'package:untitled1/data/data.dart';
import 'package:untitled1/models/order.dart';

class RecentOrders extends StatelessWidget {
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Image(
                      image: AssetImage(order.food.imageUrl),
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          order.date,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
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
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
              iconSize: 30.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.3,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
          ),
        ),
      ],
    );
  }
}
