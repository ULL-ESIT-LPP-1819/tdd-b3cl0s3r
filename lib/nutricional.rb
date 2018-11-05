require "nutricional/version"

class Tag
  attr_reader :nombre, :venergetico, :cgrasas, :cgsaturadas, :hidratos, :azucares, :proteinas, :sal

  def initialize(v1, v2, v3, v4, v5, v6, v7, v8)
    @nombre = v1
    @venergetico = v2
    @cgrasas = v3
    @cgsaturadas = v4
    @hidratos = v5
    @azucares = v6
    @proteinas = v7
    @sal = v8
  end
end
