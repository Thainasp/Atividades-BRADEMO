class Laptop{
    int id;
    String nome;
    int ram;
    double clockCPU;

    Laptop(this.id, this.nome, this.ram, this.clockCPU);

    Laptop.navegacao(int id, String nome, int ram, double clockCPU) : this(id, nome, ram, clockCPU);

    Laptop.escritorio(int id, String nome, int ram, double clockCPU) : this(id, nome, ram, clockCPU);

    Laptop.programacao(int id, String nome, int ram, double clockCPU) : this(id, nome, ram, clockCPU);    
  }

void main(){
  
  Laptop laptopNavegacao = Laptop.navegacao(1, "Dell", 8, 2.5);
  Laptop laptopEscritorio = Laptop.escritorio(2, "Acer", 16, 3.0);
  Laptop laptopProgramacao = Laptop.programacao(3, "Asus", 32, 3.5);

  print("Em nossas lojas temos os seguintes modelos de laptops: ");
  
  print("Modelo mais adequado para navegação: ${laptopNavegacao.nome}, RAM: ${laptopNavegacao.ram}GB, Clock CPU: ${laptopNavegacao.clockCPU}GHz");

  print("Modelo mais adequado para escritório: ${laptopEscritorio.nome}, RAM: ${laptopEscritorio.ram}GB, Clock CPU: ${laptopEscritorio.clockCPU}GHz");

  print("Modelo mais adequado para programação: ${laptopProgramacao.nome}, RAM: ${laptopProgramacao.ram}GB, Clock CPU: ${laptopProgramacao.clockCPU}GHz");
}