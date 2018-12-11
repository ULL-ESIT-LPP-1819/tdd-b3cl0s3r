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
    @tag5 = Tag.new("Pechuga", 20, 43, 0, 2.1, 2.1, 0, 13)
    @tag6 = Tag.new("Mesa", 500, 63, 0, 2.1, 2.1, 0, 13)
    @tag7 = Tag.new("Chicha", 500, 63, 0, 2.1, 2.1, 0, 13)
    @tag8 = Tag.new("Galletas", 20, 43, 0, 2.1, 2.1, 0, 13)
    @tag9 = Tag.new("Papa fritas", 20, 43, 0, 2.1, 2.1, 0, 13)

    @menu1 = Lista.new()
    @menu2 = Lista.new()
    @menu3 = Lista.new()
    @menu4 = Lista.new()
    @menu5 = Lista.new()
  end

  it "Funcionan las funciones" do
    expect(@person1.peso_teorico_ideal).to eq(0)
    expect(@person1.gasto_energetico_basal).to eq(0)
    expect(@person1.efecto_termogeno).to eq(0)
    expect(@person1.factor_actividad).to eq(0)
    expect(@person1.gasto_actividad_fisica).to eq(0)
    expect(@person1.gasto_energetico_total).to eq(0)
  end

  it "Pruebas Menu" do
    @menu1.insert(@tag)
    @menu1.insert(@tag2)
    @menu1.insert(@tag3)
    @menu1.insert(@tag4)
    @menu1.insert(@tag5)

    @menu2.insert(@tag5)
    @menu2.insert(@tag4)
    @menu2.insert(@tag3)
    @menu2.insert(@tag2)
    @menu2.insert(@tag)

    @menu3.insert(@tag3)
    @menu3.insert(@tag4)
    @menu3.insert(@tag)
    @menu3.insert(@tag5)
    @menu3.insert(@tag2)

    @menu4.insert(@tag9)
    @menu4.insert(@tag8)
    @menu4.insert(@tag7)
    @menu4.insert(@tag2)
    @menu4.insert(@tag5)

    @menu5.insert(@tag7)
    @menu5.insert(@tag6)
    @menu5.insert(@tag5)
    @menu5.insert(@tag6)
    @menu5.insert(@tag7)

    expect(@menu1.collect { |x| x.round(1)}).to eq([1])
    a = @menu1.reduce(:+)


  end

end
