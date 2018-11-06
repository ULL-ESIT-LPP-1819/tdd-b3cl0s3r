require "nutricional/version"

class Tag
  attr_accessor :nombre, :venergetico, :cgrasas, :cgsaturadas, :hidratos, :azucares, :proteinas, :sal, :monoinsat, :poliinsat, :polialcol, :almidon, :fibra

  def initialize(v1, v2, v3, v4, v5, v6, v7, v8)
    @nombre = v1
    @venergetico = v2
    @cgrasas = v3
    @cgsaturadas = v4
    @hidratos = v5
    @azucares = v6
    @proteinas = v7
    @sal = v8
    @monoinsat = 0
    @poliinsat = 0
    @polialcol = 0
    @almidon = 0
    @fibra = 0
  end

  def calcularkj
    37*@cgrasas+37*@monoinsat+37*@poliinsat+17*@hidratos+10*@polialcol+17*@almidon+8*@fibra+17*@proteinas+25*@sal
  end

  def calcularkcal
    9*@cgrasas+9*@monoinsat+9*@poliinsat+4*@hidratos+2.4*@polialcol+4*@almidon+2*@fibra+4*@proteinas+6*@sal
  end

  def calcularir(valor)
    suma = @venergetico+@cgrasas+@cgsaturadas+@hidratos+@azucares+@proteinas+@sal+@monoinsat+@poliinsat+@polialcol+@almidon+@fibra
    (valor*100)/suma.round(0)
  end

  def to_s
    puts "\nNombre etiqueta: #{@nombre}\t\t\t IR"
    puts  "Valor energético: #{self.calcularkj} kj / #{self.calcularkcal} kcal"
    puts  "Grasas de las cuales: #{@cgrasas} g\t\t\t #{self.calcularir(@cgrasas)}%"
    puts  "Saturadas: #{@cgsaturadas} g\t\t\t\t\t #{self.calcularir(@cgsaturadas)}%"
    puts  "Monoinsaturadas: #{@monoinsat} g\t\t\t\t #{self.calcularir(@monoinsat)}%"
    puts  "Poliinsaturadas: #{@poliinsat} g\t\t\t\t #{self.calcularir(@poliinsat)}%"
    puts  "Hidratos de carbono, de los cuales: #{@hidratos} g\t #{self.calcularir(@hidratos)}%"
    puts  "Azúcares: #{@azucares} g\t\t\t\t\t #{self.calcularir(@azucares)}%"
    puts  "Polialcoles: #{@polialcol} g\t\t\t\t #{self.calcularir(@polialcol)}%"
    puts  "Almidon: #{@almidon} g\t\t\t\t\t #{self.calcularir(@almidon)}%"
    puts  "Fibra: #{@fibra} g\t\t\t\t\t #{self.calcularir(@fibra)}%"
    puts  "Proteinas: #{@proteinas} g\t\t\t\t\t #{self.calcularir(@proteinas)}%\n\n"
  end


  def irref
    puts  "Valor energético: 8.400kJ / 2000 kcal/g"
    puts  "Grasas total: 70 g"
    puts  "Acidos grasos saturados: 20 g"
    puts  "Hidratos de carbono: 260 g"
    puts  "Azúcares: 90 g"
    puts  "Proteinas: 50 g"
    puts  "Sal: 6 g"
  end

end
