import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelmenu/Model.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Model m = Get.put(Model());
    return Scaffold(
      appBar: AppBar(title: Text("Hottel Menu")),
      body: Column(
        children: [
          Container(
              color: Colors.amber,
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              child: Text(
                "Hotel Menu",
                style: GoogleFonts.aleo(fontSize: 25),
              )),
          Container(
            color: Colors.black45,
            height: 40,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => Text("Total = ${m.sum}",
                      style: GoogleFonts.aBeeZee(fontSize: 20))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          onPrimary: Colors.amber,
                          primary: Color(0x41000000),
                          fixedSize: Size(130, 40)),
                      onPressed: () {
                      m.show_toaset();
                        // Fluttertoast.showToast(
                        //   msg: "Please Select Your Item...",
                        //   toastLength: Toast.LENGTH_SHORT,
                        //   gravity: ToastGravity.BOTTOM,
                        //   timeInSecForIosWeb: 1,
                        //   backgroundColor: Colors.white60,
                        //   textColor: Colors.black,
                        // );

                      },
                      child: Text(
                        "Submit order",
                        style: GoogleFonts.aBeeZee(color: Colors.black),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: GridView.builder(
              itemCount: m.Item.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 3, crossAxisSpacing: 3),
              itemBuilder: (context, index) {
                return GridTile(
                    header: Text("${m.Item[index]}"),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${m.foodimage[index]}"),
                            fit: BoxFit.fill),
                      ),
                      child: Obx(() => CheckboxListTile(
                            activeColor: Colors.red,
                            checkColor: Colors.blue,
                            value: m.c1[index],
                            title: Text("MRP=${m.mrp[index]}",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    backgroundColor: Colors.white,
                                    fontSize: 10,
                                    color: Colors.red)),
                            onChanged: (value) {
                              value = m.c1[index];
                              print("vall = $value");
                              m.calc(value, index);
                            },
                          )),
                    ));
              },
            ),
          ))
        ],
      ),
    );
  }
}
