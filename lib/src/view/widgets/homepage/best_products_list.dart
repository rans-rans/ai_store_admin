import 'package:flutter/material.dart';

class BestProductsList extends StatelessWidget {
  const BestProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: screenSize.height * 0.28,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Best product rating",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 5,
                  ),
                  width: screenSize.width * 0.4,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.1,
                            width: screenSize.width * 0.4,
                            child: const Placeholder(
                              //TODO item image comes here
                              child: Text("image"),
                            ),
                          ),
                          //TODO product name comes here
                          const Text(
                            "Simply Good Cream Cracker original biscuits",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const Text("4.5"),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(height: screenSize.height * 0.05),
                              //TODO product-price comes here
                              const Text(
                                "₵2.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
