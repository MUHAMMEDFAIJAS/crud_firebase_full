import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lastproject/model/model.dart';
import 'package:lastproject/view/add_screen.dart';
import 'package:lastproject/view/editscreen.dart';
import 'package:lastproject/view/service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: Service().getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error${snapshot.hasError}'),
            );
          } else {
            List<QueryDocumentSnapshot<Servicemodel>> studentdoc =
                snapshot.data?.docs ?? [];

            if (studentdoc.isEmpty) {
              return const Center(
                child: Text('no data available'),
              );
            }
            return ListView.builder(
              itemCount: studentdoc.length,
              itemBuilder: (context, index) {
                final data = studentdoc[index].data();
                final id = studentdoc[index].id;
                return ListTile(
                    title: Text(data.name!),
                    subtitle: Text(data.num.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Service().deletedata(studentdoc[index].id);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Editscreen(
                                  id: id,
                                  servmodel: Servicemodel(
                                      address: data.address,
                                      email: data.email,
                                      name: data.name,
                                      num: int.tryParse(data.num.toString())),
                                ),
                              ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ))
                      ],
                    ));
              },
            );
          }
        },
      ),
    );
  }
}
