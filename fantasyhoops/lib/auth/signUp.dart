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
          Padding(
            padding: EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20
            ),
            child: RegistrationForm(),
          ),
        ]
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
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              hintText: "Email",
              hintStyle: TextStyle(
                fontSize: 30
              )
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
              hintText: "Password",
              hintStyle: TextStyle(
                fontSize: 30,
              ),
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
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              counterText: " ",
              labelText: "Confirmed Password",
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
              backgroundColor:  Colors.white,
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
