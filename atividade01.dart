//cadastro de equipamento IFSP
void main() {
  var equipamento = "Impressora 3D";
  String local = "Laboratório de Protótipos";
  dynamic patrimonio = 12345;
  patrimonio = "12345-A";

  // É possível mudar o tipo de dado da variável, pois ela é do tipo dynamic (permite a troca), a variável "local" sendo do tipo String não pode ser redefinida para outro tipo de dado.

  print(equipamento + " está no " + local + ", o nº de patrimônio é: " + patrimonio);
  print(equipamento is String);
  print(local is String);
  print(patrimonio is String);
}
