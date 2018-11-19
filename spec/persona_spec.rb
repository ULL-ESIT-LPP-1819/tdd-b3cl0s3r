RSpec.describe Nutricional do


  before :each do
    @person1 = Paciente.new("Marta", Datos.new(180,90,17,"hombre", 105, 130))
    @person2 = Paciente.new("Fer", Datos.new(156, 50, 9, "mujer", 60, 80))
    @person3 = Paciente.new("Sonia", Datos.new(179, 112, 57, "hombre", 200, 60))
    @person4 = Paciente.new("Jorge", Datos.new(156, 200, 84, "mujer", 110, 100))
    @person0 = Paciente.new("Diego", Datos.new(176, 255, 23, "mujer", 150, 120))
    @person6 = Persona.new("Pepe")
  end

  it "Comprobación clase de un objeto" do
    expect(@person1).to be_a_kind_of(Persona)
    expect(@person1).to be_a_kind_of(Paciente)
    expect(@person1).not_to be_a_kind_of(Tag)
  end


#  it "Comprobación tipo de un objeto" do

#  end


#  it "Comprobación pertenece a una jerarquía" do

#  end


#  it "Pruebas para clasificar según masa corporal" do

#  end
end
