import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_demo/blocs/user_bloc.dart';
import 'package:flutter_app_bloc_demo/model/user.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = UserBloc();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            StreamBuilder(
            stream: userBloc.phoneController.stream,
              builder: (context, snapshot) =>
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,

                        hintText: "Phone"
                    ),
                  ),
            ),
            StreamBuilder(
              stream: userBloc.passController.stream,
              builder: (context, snapshot) =>
                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        hintText: "Password"
                    ),
                  ),
            ),
            StreamBuilder<User>(
              stream: userBloc.subject.stream,
              builder: (context,AsyncSnapshot<User> snapshot) =>
                RaisedButton(onPressed: (){

                  userBloc.submitLogin(phoneController.text,passController.text);
                  if(snapshot.hasData){
                    Navigator.of(context).pushNamed('/home');
                  }
                  if(snapshot.hasError){
                    print("dddd");
                    Dialog(child: Text("Error"),
                    );
                  }
                  },
            child: Text("Login"),),
        ),
        ],
      ),
    ),)
    ,
    )
    ,

    );
  }
}
