import 'package:crud_app/crud_app/database_services.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('NoteBook App'), centerTitle: true),
      body: SafeArea(
        child: Form(
          key: formKey,

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFormField(

                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please Enter title';
                    }
                    return null;
                  },
                  controller: titleC,
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(

                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please Enter title';
                    }
                    return null;
                  },
                  controller: detailC,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Enter detail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                       minimumSize: MaterialStateProperty.all(Size(double.infinity, 40))
                    ),
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        DatabaseServices.addData(titleC.text, detailC.text);
                      }
                }, 
                    child: Text('Add',
                    style: TextStyle(
                      color: Colors.white
                    ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
