import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/database_helper.dart';
import 'package:vritti_task/widgets/custom_button.dart';
import 'package:vritti_task/widgets/text_form_field.dart';

import '../business_logic/bloc/get_employee_data_from_local_storage/get_employee_list_from_local_storage_bloc.dart';

class UpdateSheet extends StatefulWidget {
  EmployeeDetails details;
  UpdateSheet({Key? key, required this.details}) : super(key: key);

  @override
  State<UpdateSheet> createState() => _UpdateSheetState();
}

class _UpdateSheetState extends State<UpdateSheet> {
  TextEditingController _firstName = TextEditingController();

  TextEditingController _lastName = TextEditingController();

  TextEditingController _email = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: widget.details.firstName);
    _lastName = TextEditingController(text: widget.details.lastName);
    _email = TextEditingController(text: widget.details.email);
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Update Employee',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextFormField(
            labelText: 'First Name',
            hintText: 'First Name',
            controller: _firstName,
          ),
          CustomTextFormField(
            labelText: 'Last Name',
            hintText: 'Last Name',
            controller: _lastName,
          ),
          CustomTextFormField(
            labelText: 'Email',
            hintText: 'Email',
            controller: _email,
          ),
          CustomButton(
              title: 'Update',
              onPressed: () {
                DatabaseHelper.updateEmployee(EmployeeDetails(
                    id: widget.details.id,
                    email: _email.text,
                    firstName: _firstName.text,
                    lastName: _lastName.text,
                    avatar: widget.details.avatar));
                BlocProvider.of<GetEmployeeListFromLocalStorageBloc>(context)
                    .add(LoadEmployeeListFromLocalStorage());
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
