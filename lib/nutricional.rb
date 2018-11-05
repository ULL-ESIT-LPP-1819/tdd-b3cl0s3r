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
end
