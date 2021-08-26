import 'package:flutter/material.dart';

class AddTaskSheet extends StatelessWidget {
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 15,
        child: Container(
          margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                keyboardType: TextInputType.name,
                controller: descController,
              ),

              FittedBox(),
//               Row(
//                 children: [
//               date!=null ?  Text( DateFormat.yMd().format(date)):Text("No date choosen"),
//                   FlatButton(
//                     child: Text(
//                       "Select Date",
//                       style: TextStyle(color: Colors.deepOrange),

//                     ),
//                     onPressed: (){
//                     showDatePicker(context: context,
//                     initialDate: DateTime.now(),

//                     firstDate:DateTime(2020),lastDate:DateTime.now(),
//                     confirmText: "Select",

//                    ).then((pickedDate){
// if(pickedDate==null) return ;
// else{ setState(() {
//   date=pickedDate;
// });
// }
//                    });
//                     },
//                   )
//                 ],
//               ),
              FlatButton(
                child: Text("Add Task"),
                color: Colors.deepOrange,
                onPressed: () {
                  if (descController.text.isEmpty == false) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                  } //! save task in screen
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
