// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/domens/repository/book_service.dart';

import '../../domens/models/book.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Comments>?>? futureBook;
  final bookData = BookRepository();

  @override
  void initState() {
    futureBook = bookData.bookFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Արշալույս',
                  style: TextStyle(
                      fontFamily: 'Armenian',
                      fontSize: 50.0,
                      color: Color.fromARGB(251, 196, 102, 1)),
                ),
              ],
            ),
          ),
        )
        // Card(
        //     child: FlipCard(
        //   front: Container(
        //     width: 500,
        //     height: 300,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: NetworkImage(
        //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC3H2MfKCqJATGdpZwAUgJ0MA497yvrR70Ng&usqp=CAU'),
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     child: const Text('Hii'),
        //   ),
        //   back: Container(
        //     width: 500,
        //     height: 300,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: NetworkImage(
        //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC4OVx5lA3DAZHQNDmcVHgWTP7-InWiDtIQQ&usqp=CAU'),
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   ),
        // )),

        //     FutureBuilder<List<Comments>?>(
        //   future: bookData.bookFetch(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           itemCount: snapshot.data!.length,
        //           itemBuilder: (context, i) {
        //             return ListTile(title: Text(snapshot.data![i].body));
        //           });
        //     } else if (snapshot.hasError) {
        //       return Text('${snapshot.hasError}');
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
        );
  }
}
