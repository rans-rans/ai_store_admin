import "package:flutter/material.dart";

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      //TODO outstanding orders come here
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 12,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person_2),
            ),
            //TODO customer name over here
            title: const Text(
              "Ransford Owusu",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            //TODO customer items number here
            subtitle: const Text("7 items"),
            trailing: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "GH₵ 345.79",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
