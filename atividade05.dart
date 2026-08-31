import 'dart:io';

class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);
}

void main(){
  List<House> houses = [];

  for (int i = 1; i <= 3; i++) {
    stdout.write('Digite o ID da casa $i: ');
    int id = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Digite o nome da casa $i: ');
    String name = stdin.readLineSync() ?? '';

    stdout.write('Digite o preço da casa $i: ');
    double price = double.parse(stdin.readLineSync() ?? '0');

    houses.add(House(id, name, price)..name = '$name (Cadastrada)');
  }

  print('\nCasas cadastradas:');
  for (var house in houses) {
    print('ID: ${house.id}');
    print('Nome: ${house.name}');
    print('Preço: ${house.price.toStringAsFixed(2)}');
    print('---');
  }
}