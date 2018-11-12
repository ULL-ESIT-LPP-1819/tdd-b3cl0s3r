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
    ## CONCATENAR Y DEVOLVER CADENA...
    a="\nNombre etiqueta: #{@nombre}\t\t\t IR"
    a+="Valor energético: #{self.calcularkj} kj / #{self.calcularkcal} kcal"
    a+="Grasas de las cuales: #{@cgrasas} g\t\t\t #{self.calcularir(@cgrasas)}%"
    a+="Saturadas: #{@cgsaturadas} g\t\t\t\t\t #{self.calcularir(@cgsaturadas)}%"
    a+="Monoinsaturadas: #{@monoinsat} g\t\t\t\t #{self.calcularir(@monoinsat)}%"
    a+="Poliinsaturadas: #{@poliinsat} g\t\t\t\t #{self.calcularir(@poliinsat)}%"
    a+="Hidratos de carbono, de los cuales: #{@hidratos} g\t #{self.calcularir(@hidratos)}%"
    a+="Azúcares: #{@azucares} g\t\t\t\t\t #{self.calcularir(@azucares)}%"
    a+="Polialcoles: #{@polialcol} g\t\t\t\t #{self.calcularir(@polialcol)}%"
    a+="Almidon: #{@almidon} g\t\t\t\t\t #{self.calcularir(@almidon)}%"
    a+="Fibra: #{@fibra} g\t\t\t\t\t #{self.calcularir(@fibra)}%"
    a+="Proteinas: #{@proteinas} g\t\t\t\t\t #{self.calcularir(@proteinas)}%\n\n"
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
