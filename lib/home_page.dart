import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String respostaFinal = '';
   final dio = Dio();
    Map<String, dynamic>? endereco;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/01001000/json/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pagina inicial',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Consumo de APIS usando DIO'),
              ElevatedButton(
                  onPressed: () async {
                    Map<String,dynamic>? enderecoAuxiliar = await getHttp();
                    setState(() {
                     endereco = enderecoAuxiliar;

                    });
                  },
                  child: Text('consultar')),
              SizedBox(
                height: 32,
              ),
              Text('${endereco?['logadouro']?? ''}'),
              Text('${endereco?['bairro']?? ''}'),
              Text('${endereco?['estado']?? ''}'),
              Text('${endereco?['cep']?? ''}'),
              Text('${endereco?['localidade']?? ''}'),
              Text('${endereco?['complemento']?? ''}'),
              Text('${endereco?['ddd']?? ''}'),
            ],
          ),
        ),
      ),
    );
  }
}


