require "nutricional/version"

class Tag

  include Comparable
  attr_accessor :nombre, :venergetico, :cgrasas, :cgsaturadas, :hidratos, :azucares, :proteinas, :sal, :monoinsat, :poliinsat, :polialcol, :almidon, :fibra

# Comparable

  def <=> (anOther)
    nombre <=> anOther.nombre
  end

# Constructor

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

# Calcular kj
  def calcularkj
    37*@cgrasas+37*@monoinsat+37*@poliinsat+17*@hidratos+10*@polialcol+17*@almidon+8*@fibra+17*@proteinas+25*@sal
  end

# Calcular Kcal
  def calcularkcal
    9*@cgrasas+9*@monoinsat+9*@poliinsat+4*@hidratos+2.4*@polialcol+4*@almidon+2*@fibra+4*@proteinas+6*@sal
  end

# Calcular Ir

  def calcularir(valor)
    suma = @venergetico+@cgrasas+@cgsaturadas+@hidratos+@azucares+@proteinas+@sal+@monoinsat+@poliinsat+@polialcol+@almidon+@fibra
    (valor*100)/suma.round(0)
  end

# Imprimir
  def to_s
    a="\nNombre etiqueta: #{@nombre}\t\t\t IR\n"
    a+="Valor energético: #{self.calcularkj} kj / #{self.calcularkcal} kcal\n"
    a+="Grasas de las cuales: #{@cgrasas} g\t\t\t #{self.calcularir(@cgrasas)}%\n"
    a+="Saturadas: #{@cgsaturadas} g\t\t\t\t\t #{self.calcularir(@cgsaturadas)}%\n"
    a+="Monoinsaturadas: #{@monoinsat} g\t\t\t\t #{self.calcularir(@monoinsat)}%\n"
    a+="Poliinsaturadas: #{@poliinsat} g\t\t\t\t #{self.calcularir(@poliinsat)}%\n"
    a+="Hidratos de carbono, de los cuales: #{@hidratos} g\t #{self.calcularir(@hidratos)}%\n"
    a+="Azúcares: #{@azucares} g\t\t\t\t\t #{self.calcularir(@azucares)}%\n"
    a+="Polialcoles: #{@polialcol} g\t\t\t\t #{self.calcularir(@polialcol)}%\n"
    a+="Almidon: #{@almidon} g\t\t\t\t\t #{self.calcularir(@almidon)}%\n"
    a+="Fibra: #{@fibra} g\t\t\t\t\t #{self.calcularir(@fibra)}%\n"
    a+="Proteinas: #{@proteinas} g\t\t\t\t\t #{self.calcularir(@proteinas)}%\n\n"
  end

#  ir de referencia
  def irref
    puts  "Valor energético: 8.400kJ / 2000 kcal/g"
    puts  "Grasas total: 70 g"
    puts  "Acidos grasos saturados: 20 g"
    puts  "Hidratos de carbono: 260 g"
    puts  "Azúcares: 90 g"
    puts  "Proteinas: 50 g"
    puts  "Sal: 6 g"
  end

  def +(anOther)
    @self.calcularkcal+anOther.calcularkcal
  end

end
