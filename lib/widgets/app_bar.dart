import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  VoidCallback onRefreshPressd;
  CustomAppBar({Key? key, required this.onRefreshPressd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xfffffff6db),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Home Page',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              )),
              InkWell(
                  onTap: onRefreshPressd,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.blue[300],
                          ),
                          Text(
                            'Refresh',
                            style: GoogleFonts.poppins(color: Colors.blue[300]),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
