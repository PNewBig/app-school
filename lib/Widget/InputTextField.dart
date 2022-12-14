import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_page/Widget/LabelForgetPAS.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
class InputTexfield extends StatefulWidget {
  final Function(String email, String password) functionHandler;
  InputTexfield({required this.functionHandler, super.key});

  @override
  State<InputTexfield> createState() => _InputTexfieldState();
}
class _InputTexfieldState extends State<InputTexfield> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  GoogleSignInAccount? _currentUser;

  void _tryToSubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      widget.functionHandler(email, password);
    }
  }

  //google sigin 
  Future<void> siginWithGoogle() async{
    try{
      await _googleSignIn.signIn();
    }catch(error){

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    _googleSignIn.onCurrentUserChanged.listen((account){
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextFormField(
                onChanged: (value) {
                  email = value.toString().trim();
                },
                validator: (value) {
                  if (!value!.contains("@gmail.com")) {
                    return "ເຈົ້າຕ້ອງປ້ອນ ";
                  } else if (value.isEmpty) {
                    return "ເຈົ້າພິມຄ່າຫວ່າງ";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    contentPadding: const EdgeInsets.only(left: 10)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextFormField(
                onChanged: (value) {
                  password = value.toString().trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ເຈົ້າພິມຄ່າຫວ່າງ";
                  } else if (value.length > 8) {
                    return "ລະຫັດຜ່ານຕ້ອງມີ 8 ໂຕ";
                  }
                },
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "password",
                    contentPadding: const EdgeInsets.only(left: 10)),
              ),
            ),
            LabelPas(labelPass: "ລື່ມລະຫັດ!"),
            Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    child: Text("ສະໝັກ"), onPressed: _tryToSubmit)),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: InkWell(
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/google.png")),
                            onTap: (){
                              siginWithGoogle();
                            },
                    ))
          ],
        ),
      ),
    );
  }



}
