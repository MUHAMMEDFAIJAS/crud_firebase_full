import 'package:flutter/material.dart';
import 'package:lastproject/model/model.dart';
import 'package:lastproject/view/service.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameControler = TextEditingController();
    TextEditingController addressControler = TextEditingController();
    TextEditingController emailControler = TextEditingController();
    TextEditingController phoneControler = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameControler,
            decoration: InputDecoration(
                hintText: 'name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextField(
            controller: addressControler,
            decoration: InputDecoration(
                hintText: 'address',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextField(
            controller: emailControler,
            decoration: InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextField(
            controller: phoneControler,
            decoration: InputDecoration(
                hintText: 'num',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextButton(
              onPressed: () {
                Service().adddata(Servicemodel(
                    name: nameControler.text,
                    address: addressControler.text,
                    email: emailControler.text,
                    num: int.tryParse(phoneControler.text)));
              },
              child: const Text('submit'))
        ],
      ),
    );
  }
}
