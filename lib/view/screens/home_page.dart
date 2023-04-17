import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          const Text('LCI groupe'),
          Image.asset('assets/images'),
          const Text('Hello!'),
          const Text('Best SChool to learn'),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
          },
              child: const Text('Login')),
          ElevatedButton(onPressed: (){}, child: const Text('Sign up')),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
