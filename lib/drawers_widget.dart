import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_design2/item_groups.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Text(
          'User Setting',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        )),
        Container(
          margin: const EdgeInsets.all(10),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fpnh7-1.fna.fbcdn.net/v/t39.30808-6/287345326_1275499062979646_4324868133087762293_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHKxyumXcUXbKRWfwX4QkXEOf-rksa2SlU5_6uSxrZKVVc99RggnoATUhm2K3y9iwK9XiqH7yQBmaDvBnQkk82M&_nc_ohc=q9kR1iYmw88AX8_6NQW&_nc_ht=scontent.fpnh7-1.fna&oh=00_AT-jmeFXsRpKt8gncIYaOxpM00Vqpb3inA5LMcAISJaDug&oe=62FB0660'),
                ),
                title: Text(
                  'Pha Phanna',
                  style: TextStyle(
                      fontFamily: 'Sacramento',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Flutter Developer'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          '267',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Track',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('39', style: TextStyle(fontSize: 18)),
                        Text('Coupons', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('846', style: TextStyle(fontSize: 18)),
                        Text('collect', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('846', style: TextStyle(fontSize: 18)),
                        Text('collect', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            IconsGroup(icons: Icons.monetization_on, icons_name: 'Wallet'),
            IconsGroup(icons: Icons.redeem, icons_name: 'Delivery'),
            IconsGroup(icons: Icons.message, icons_name: 'Message'),
            IconsGroup(icons: Icons.currency_bitcoin, icons_name: 'service'),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            leading: CircleAvatar(child: Icon(Icons.location_on)),
            title: Text('Address'),
            subtitle: Text('Ensure your harvesting address'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon(Icons.lock_person_sharp),
            ),
            title: Text('Privacy'),
            subtitle: Text('System permission change'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 210, 195, 62),
                child: Icon(Icons.menu)),
            title: Text('General'),
            subtitle: Text('Basic function setting'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 14, 145, 162),
                child: Icon(Icons.notifications_active)),
            title: Text('Notifications'),
            subtitle: Text('Take over the news in time'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 117, 96, 132),
                child: Icon(Icons.contact_support)),
            title: Text('Support'),
            subtitle: Text('We are here to help'),
          ),
        ),
      ],
    );
  }
}
