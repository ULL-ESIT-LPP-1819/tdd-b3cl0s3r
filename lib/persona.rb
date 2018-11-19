class Persona
  attr_accessor :name

  def initialize(nombre)
    @name=nombre
  end

end



class Paciente < Persona

  attr_accessor :datos

  def initialize(nombre, datos)
    @name=nombre
    @datos=datos
  end

  def <=>
  end
end
