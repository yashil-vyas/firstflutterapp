import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changebutton = false ;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context)async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, CatalogRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/loginimage.png",fit: BoxFit.cover, ),
              SizedBox(height: 20.0,),
              Text("Welcome $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter Username",labelText: "Username"),
                    onChanged: (value){
                      name = value;
                      setState(() {
                      });
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Enter Password",labelText: "Password",),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be Empty";
                      }
                      else if(value.length<6 ){
                        return "Password length should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.0),

                  Material(
                    color: Colors.indigo,
                      borderRadius: BorderRadius.circular(changebutton ? 50 : 8 ),
                    child: InkWell(
                      onTap: ()=> moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changebutton ? 50 :  150,
                          height: 50,
                        alignment: Alignment.center,
                        child: changebutton?Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),

                      ),
                    ),
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
