# Clase persona

class Persona
  attr_accessor :name
  include Comparable

# Constructor

  def initialize(nombre)
    @name=nombre
  end

# Comparable

  def <=>(anOther)
    self.name <=> anOther.name
  end

# Imprimir
  def to_s
    "#{name}"
  end

end


# Clase paciente

class Paciente < Persona

  attr_accessor :datos

# Constructor paciente
  def initialize(nombre, datos)
    @name=nombre
    @datos=datos
  end

# Devolver datos

  def devolver_datos
    return @datos
  end

  def to_s
    a+="#{name}"
    a+=name.to_s
  end
end
