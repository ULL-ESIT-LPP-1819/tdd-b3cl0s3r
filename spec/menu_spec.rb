RSpec.describe Nutricional do

  before :each do
    @person1 = Paciente.new("Marta", Datos.new(180,90,17,"hombre", 105, 130, "Reposo"))
    @person2 = Paciente.new("Fer", Datos.new(156, 50, 9, "mujer", 60, 80, "Actividad ligera"))
    @person3 = Paciente.new("Oto", Datos.new(179, 112, 57, "hombre", 200, 60, "Actividad moderada"))
    @person4 = Paciente.new("Eco", Datos.new(156, 200, 84, "mujer", 110, 100, "Actividad intensa"))
    @person0 = Paciente.new("Diego", Datos.new(176, 255, 23, "mujer", 150, 120, "Reposo"))

    @tag = Tag.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
    @tag2 = Tag.new("Hamburguesa", 500, 63, 0, 2.1, 2.1, 0, 13)
    @tag3 = Tag.new("Zapato", 500, 63, 0, 2.1, 2.1, 0, 13)
    @tag4 = Tag.new("Golosina", 500, 63, 0, 2.1, 2.1, 0, 13)
    @tag5 = Tag.new("Golosina", 500, 63, 0, 2.1, 2.1, 0, 13)
    
    @menu1 = Lista.new()
    @menu2 = Lista.new()
  end

  it "Funcionan las funciones" do

  end


end
