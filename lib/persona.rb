# Clase persona

class Persona
  attr_accessor :name
  include Comparable
  include Enumerable
  
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

  def peso_teorico_ideal
    (datos.altura-150)*0.75+50
  end

  def gasto_energetico_basal
    if @datos.sexo == "hombre"
      10*datos.peso+6.25*datos.altura-5*datos.edad-161
    else
      10*datos.peso+6.25*datos.altura-5*datos.edad+5
    end
  end

  def efecto_termogeno
    self.gasto_energetico_basal*0.1
  end

  def factor_actividad
    if @datos.nivelact == "Reposo"
      return 0.0
    elsif @datos.nivelact == "Actividad ligera"
      return 0.12
    elsif @datos.nivelact == "Actividad moderada"
      return 0.27
    elsif @datos.nivelact == "Actividad intensa"
      return 0.54
    end
  end

  def gasto_actividad_fisica
    self.gasto_energetico_basal*self.factor_actividad
  end

  def gasto_energetico_total
    self.gasto_energetico_basal+self.efecto_termogeno+self.gasto_actividad_fisica
  end
end
