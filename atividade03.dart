class Laptop{
    int id;
    String nome;
    int ram;
    double clockCPU;

    Laptop(this.id, this.nome, this.ram, this.clockCPU);
  }

void main(){

  Laptop laptop1 = Laptop(1, "Dell", 8, 2.5);
  Laptop laptop2 = Laptop(2, "Acer", 16, 3.0);
  Laptop laptop3 = Laptop(3, "Asus", 32, 3.5);
  Laptop laptop4 = Laptop(4, "Lenovo", 64, 4.0);

  print("Em nossas lojas temos os seguintes modelos de laptops: ");
  print("Modelo: ${laptop1.nome}, RAM: ${laptop1.ram}GB, Clock CPU: ${laptop1.clockCPU}GHz");
  print("Modelo: ${laptop2.nome}, RAM: ${laptop2.ram}GB, Clock CPU: ${laptop2.clockCPU}GHz");
  print("Modelo: ${laptop3.nome}, RAM: ${laptop3.ram}GB, Clock CPU: ${laptop3.clockCPU}GHz");
  print("Modelo: ${laptop4.nome}, RAM: ${laptop4.ram}GB, Clock CPU: ${laptop4.clockCPU}GHz");
}