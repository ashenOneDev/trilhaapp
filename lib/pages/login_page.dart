import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 8,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Já tem cadastro?",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Faça seu login e make the change_",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Informe seu email:",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 3,
                      child:
                          Text("Email", style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("Informe sua senha:",
                          style: TextStyle(color: Colors.white))),
                  Expanded(
                      flex: 3,
                      child:
                          Text("Senha", style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: Text("Login"),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                "Esqueci minha senha",
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                "Criar conta",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    ));
  }
}
