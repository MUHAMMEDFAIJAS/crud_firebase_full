import 'package:flutter/material.dart';
import 'package:lastproject/model/model.dart';
import 'package:lastproject/view/service.dart';

class Editscreen extends StatefulWidget {
  String? id;
  final Servicemodel servmodel;

  Editscreen({
    super.key,
    this.id,
    required this.servmodel,
  });

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameControler =
        TextEditingController(text: widget.servmodel.name);
    TextEditingController addressControler =
        TextEditingController(text: widget.servmodel.address);
    TextEditingController emailControler =
        TextEditingController(text: widget.servmodel.email);
    TextEditingController phoneControler =
        TextEditingController(text: widget.servmodel.num.toString());
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
                Servicemodel stmoddel = Servicemodel(
                    name: nameControler.text,
                    address: addressControler.text,
                    email: emailControler.text,
                    num: int.tryParse(phoneControler.text));

                Service().update(stmoddel,widget.id!);
              },
              child: const Text('update'))
        ],
      ),
    );
  }
}
