import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          RegistrationForm()
        ],
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final _formKey = GlobalKey<FormState>();
  final _emailTC = TextEditingController();
  final _passwordTC = TextEditingController();
  String? email;
  String? password;
  bool _obscureText = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTC,
            decoration: const InputDecoration(

              prefixIcon: Icon(Icons.account_circle),
              counterText: " ",
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
            onSaved: (val) {
              email = val;
            },
            validator: (value) {
              if (value!.isEmpty){
                return "Please Enter Email";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordTC,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: GestureDetector(
                child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              counterText: " ",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            obscureText: !_obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty){
                return "Please Enter Password";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              counterText: " ",
              labelText: "Confirmed Password",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value != _passwordTC.text){
                return "Passwords don't match";
              }
              return null;
            },
          ),
          Row(
            children: [
              Checkbox(
                onChanged: (_){
                  setState(() {
                    agree = !agree;
                  });
                },
                value: agree,
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                      "By creating account, I agree to Terms & Conditions and Privacy Policy.")
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:  Color.fromRGBO(159,169,78,1),
            ),
            onPressed: (){
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => RoutePage()));

              // if(_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   AuthenticationFunctions()
              //       .SignUp(email: email!, password: password!)
              //       .then((result){
              //     if (result == null){
              //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RoutePage()));
              //     } else {
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text(
              //           result,
              //           style: const TextStyle(fontSize:16),
              //         ),
              //       ));
              //     }
              //   });
              // }
            },
            child: Text("Sign Up"),
          )
        ],
      ),
    );
  }
}
