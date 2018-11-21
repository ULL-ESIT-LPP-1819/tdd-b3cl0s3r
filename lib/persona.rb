class Persona
  attr_accessor :name

  def initialize(nombre)
    @name=nombre
  end

  def to_s
    "#{name}"
  end

end



class Paciente < Persona

  attr_accessor :datos

  def initialize(nombre, datos)
    @name=nombre
    @datos=datos
  end

  def devolver_datos
    return @datos
  end

  def to_s
    a+="#{name}"
    a+=name.to_s
  end
end
