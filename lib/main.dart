import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const wpersonalizado());
}

class wpersonalizado extends StatelessWidget {
  const wpersonalizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //funcoess

  int cout = 0;
  void entrou() {
    setState(() {
      cout++;
    });
    print("$cout");
  }

  void saiu() {
    setState(() {
      cout--;
    });
    print("$cout");
  }

  bool get isFull => cout == 20;
  bool get isEmpty => cout == 0;

  //funçoes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isFull
          ? Colors.red
          : isEmpty
              ? Color.fromRGBO(202, 202, 190, 25)
              : Colors.green,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull
                  ? " Loja Cheia"
                  : isEmpty
                      ? "Sem clientes"
                      : "Bem vindo !",
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              isFull
                  ? "Capacidade maxima atingida : "
                  : isEmpty
                      ? "Loja vazia no momento:"
                      : "Número de clientes na loja:",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              "$cout",
              style: const TextStyle(color: Colors.white, fontSize: 120),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : entrou,
                  style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white54 : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: isEmpty ? null : saiu,
                  style: TextButton.styleFrom(
                    fixedSize: const Size(100, 100),
                    backgroundColor: isEmpty ? Colors.white54 : Colors.white,
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "SAIR",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
