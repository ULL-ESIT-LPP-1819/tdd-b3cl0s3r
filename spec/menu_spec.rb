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
    @tag6 = Tag.new("Mesa", 100, 6, 0, 2.1, 2.1, 0, 13)
    @tag7 = Tag.new("Chicha", 200, 79, 0, 2.1, 2.1, 0, 13)
    @tag8 = Tag.new("Galletas", 50, 23, 0, 2.1, 2.1, 0, 13)
    @tag9 = Tag.new("Papa fritas", 0, 43, 0, 2.1, 2.1, 0, 13)

    @lkcal = Lista.new()
    @menu1 = Lista.new()
  end

  it "Funcionan las funciones" do
    expect(@person1.peso_teorico_ideal).to eq(72.5)
    expect(@person1.gasto_energetico_basal).to eq(1779.0)
    expect(@person1.efecto_termogeno).to eq(177.9)
    expect(@person1.factor_actividad).to eq(0.0)
    expect(@person1.gasto_actividad_fisica).to eq(0.0)
    expect(@person1.gasto_energetico_total).to eq(1956.9)
  end

  it "Pruebas Menu 1" do
    @menu1.insert(@tag)
    @menu1.insert(@tag2)
    @menu1.insert(@tag3)
    @menu1.insert(@tag4)
    @menu1.insert(@tag5)

    @lkcal.insert(@tag.calcularkcal.round(1))
    @lkcal.insert(@tag2.calcularkcal.round(1))
    @lkcal.insert(@tag3.calcularkcal.round(1))
    @lkcal.insert(@tag4.calcularkcal.round(1))
    @lkcal.insert(@tag5.calcularkcal.round(1))

    expect(@menu1.collect { |x| x.calcularkcal.round(1)}).to eq([8.5, 653.4, 653.4, 653.4, 473.4])

    suma = @lkcal.reduce(:+)

    expect(suma.between?(@person1.gasto_energetico_total*0.90, @person1.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person2.gasto_energetico_total*0.90, @person2.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person3.gasto_energetico_total*0.90, @person3.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person4.gasto_energetico_total*0.90, @person4.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person0.gasto_energetico_total*0.90, @person0.gasto_energetico_total*1.10)).to be false
  end

  it "Pruebas Menu 2" do
    @lkcal.insert(@tag7.calcularkcal.round(1))
    @lkcal.insert(@tag6.calcularkcal.round(1))
    @lkcal.insert(@tag9.calcularkcal.round(1))
    @lkcal.insert(@tag8.calcularkcal.round(1))
    @lkcal.insert(@tag7.calcularkcal.round(1))

    suma = @lkcal.reduce(:+)

    expect(suma.between?(@person1.gasto_energetico_total*0.90, @person1.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person2.gasto_energetico_total*0.90, @person2.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person3.gasto_energetico_total*0.90, @person3.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person4.gasto_energetico_total*0.90, @person4.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person0.gasto_energetico_total*0.90, @person0.gasto_energetico_total*1.10)).to be false
  end

  it "Pruebas Menu 3" do
    @lkcal.insert(@tag.calcularkcal.round(1))
    @lkcal.insert(@tag9.calcularkcal.round(1))
    @lkcal.insert(@tag8.calcularkcal.round(1))
    @lkcal.insert(@tag5.calcularkcal.round(1))
    @lkcal.insert(@tag2.calcularkcal.round(1))

    suma = @lkcal.reduce(:+)

    expect(suma.between?(@person1.gasto_energetico_total*0.90, @person1.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person2.gasto_energetico_total*0.90, @person2.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person3.gasto_energetico_total*0.90, @person3.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person4.gasto_energetico_total*0.90, @person4.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person0.gasto_energetico_total*0.90, @person0.gasto_energetico_total*1.10)).to be false
  end

  it "Pruebas Menu 4" do
    @lkcal.insert(@tag2.calcularkcal.round(1))
    @lkcal.insert(@tag4.calcularkcal.round(1))
    @lkcal.insert(@tag6.calcularkcal.round(1))
    @lkcal.insert(@tag8.calcularkcal.round(1))
    @lkcal.insert(@tag6.calcularkcal.round(1))

    suma = @lkcal.reduce(:+)

    expect(suma.between?(@person1.gasto_energetico_total*0.90, @person1.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person2.gasto_energetico_total*0.90, @person2.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person3.gasto_energetico_total*0.90, @person3.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person4.gasto_energetico_total*0.90, @person4.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person0.gasto_energetico_total*0.90, @person0.gasto_energetico_total*1.10)).to be false
  end

  it "Pruebas Menu 5" do
    @lkcal.insert(@tag.calcularkcal.round(1))
    @lkcal.insert(@tag7.calcularkcal.round(1))
    @lkcal.insert(@tag3.calcularkcal.round(1))
    @lkcal.insert(@tag5.calcularkcal.round(1))
    @lkcal.insert(@tag9.calcularkcal.round(1))

    suma = @lkcal.reduce(:+)

    expect(suma.between?(@person1.gasto_energetico_total*0.90, @person1.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person2.gasto_energetico_total*0.90, @person2.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person3.gasto_energetico_total*0.90, @person3.gasto_energetico_total*1.10)).to be true
    expect(suma.between?(@person4.gasto_energetico_total*0.90, @person4.gasto_energetico_total*1.10)).to be false
    expect(suma.between?(@person0.gasto_energetico_total*0.90, @person0.gasto_energetico_total*1.10)).to be false
  end
end
