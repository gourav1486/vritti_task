import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_data_from_local_storage/get_employee_list_from_local_storage_bloc.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/database_helper.dart';
import 'package:vritti_task/widgets/update_sheet.dart';

class DetailsView extends StatefulWidget {
  EmployeeDetails details;
  DetailsView({Key? key, required this.details}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.5 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Color(0xfffffff6db),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.details.avatar,
                ),
              ),
            ),
            Text('${widget.details.firstName} ${widget.details.lastName}',
                style: GoogleFonts.poppins(fontSize: 24)),
            Text(widget.details.email,
                style: GoogleFonts.poppins(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          context: context,
                          builder: (context) {
                            return UpdateSheet(details: widget.details);
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Edit',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.blue[300],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      DatabaseHelper.deleteEmployee(widget.details.id);
                      BlocProvider.of<GetEmployeeListFromLocalStorageBloc>(
                              context)
                          .add(LoadEmployeeListFromLocalStorage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Delete',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.blue[300],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
