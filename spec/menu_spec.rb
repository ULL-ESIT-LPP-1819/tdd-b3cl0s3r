

RSpec.describe Nutricional do

  before :each do
    @person1 = Paciente.new("Marta", Datos.new(180,90,17,"hombre", 105, 130, "Reposo"))
    @person2 = Paciente.new("Fer", Datos.new(156, 50, 9, "mujer", 60, 80, "Actividad ligera"))
    @person3 = Paciente.new("Oto", Datos.new(179, 112, 57, "hombre", 200, 60, "Actividad moderada"))
    @person4 = Paciente.new("Eco", Datos.new(156, 200, 84, "mujer", 110, 100, "Actividad intensa"))
    @person0 = Paciente.new("Diego", Datos.new(176, 255, 23, "mujer", 150, 120, "Reposo"))

    @tag = Tag.new("Freeway", 19, 0, 0, 2.1, 2.1, 0, 0.02)
    @tag2 = Tag.new("Hamburguesa", 556, 63, 0, 2.1, 2.1, 0, 13)
    @tag3 = Tag.new("Zapato", 130, 63, 0, 2.1, 2.1, 0, 13)
    @tag4 = Tag.new("Golosina", 300, 63, 0, 2.1, 2.1, 0, 13)
    @tag5 = Tag.new("Pechuga", 24, 43, 0, 2.1, 2.1, 0, 13)
    @tag6 = Tag.new("Mesa", 111, 6, 0, 2.1, 2.1, 0, 13)
    @tag7 = Tag.new("Chicha", 202, 79, 0, 2.1, 2.1, 0, 13)
    @tag8 = Tag.new("Galletas", 55, 23, 0, 2.1, 2.1, 0, 13)
    @tag9 = Tag.new("Papa fritas", 223, 43, 0, 2.1, 2.1, 0, 13)

    @lkcal = Lista.new()

    @menu1 = Lista.new()
    @menu11 = Lista.new()
    @menu2 = Lista.new()
    @menu3 = Lista.new()
    @menu4 = Lista.new()
    @menu5 = Lista.new()
    @menu6 = Lista.new()
    @menu7 = Lista.new()
    @menu8 = Lista.new()
    @menu9 = Lista.new()
    @menu10 = Lista.new()

    @vectormenus = []
    @listaindv = Lista.new()

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

  it "Prueba con Zip" do
    @lkcal.insert(@tag.calcularkcal.round(1))
    @lkcal.insert(@tag2.calcularkcal.round(1))
    @lkcal.insert(@tag3.calcularkcal.round(1))
    @lkcal.insert(@tag4.calcularkcal.round(1))
    @lkcal.insert(@tag5.calcularkcal.round(1))

    @menu1.insert(@tag.calcularkcal.round(1))
    @menu1.insert(@tag7.calcularkcal.round(1))
    @menu1.insert(@tag8.calcularkcal.round(1))
    @menu1.insert(@tag6.calcularkcal.round(1))
    @menu1.insert(@tag2.calcularkcal.round(1))

    expect(@lkcal.zip(@menu1)).to eq([[8.5, 8.5], [653.4, 797.4], [653.4, 293.4], [653.4, 140.4], [473.4, 653.4]])
    expect(@lkcal.zip(@menu1).class).to eq(Array)
  end

  it "Pruebas Array de Menus" do

    @menu11.insert(@tag)
    @menu11.insert(@tag2)
    @menu11.insert(@tag2)

    @menu2.insert(@tag5)
    @menu2.insert(@tag4)

    @menu3.insert(@tag3)
    @menu3.insert(@tag4)

    @menu4.insert(@tag5)
    @menu4.insert(@tag9)
    @menu4.insert(@tag7)
    @menu4.insert(@tag3)

    @menu5.insert(@tag9)
    @menu5.insert(@tag8)

    @menu6.insert(@tag)
    @menu6.insert(@tag)
    @menu6.insert(@tag5)
    @menu6.insert(@tag4)

    @menu7.insert(@tag3)
    @menu7.insert(@tag3)


    @menu8.insert(@tag4)
    @menu8.insert(@tag9)
    @menu8.insert(@tag9)
    @menu8.insert(@tag9)

    @menu9.insert(@tag4)
    @menu9.insert(@tag2)

    @menu10.insert(@tag8)
    @menu10.insert(@tag8)
    @menu10.insert(@tag8)
    @menu10.insert(@tag8)
    @menu10.insert(@tag8)
    @menu10.insert(@tag8)

    ### CORREGIR SUMA
    @vectormenus.push(@menu11.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu2.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu3.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu4.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu5.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu6.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu7.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu8.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu9.reduce(0){ |sum, x| sum+x.calcularkcal})
    @vectormenus.push(@menu10.reduce(0){ |sum, x| sum+x.calcularkcal})

    puts Benchmark.measure {
      expect(@vectormenus.sort_each).to eq( [766.8, 1126.8, 1143.84, 1306.8, 1306.8, 1306.8, 1315.32, 1760.4, 2073.6, 2397.6])
    }
    puts Benchmark.measure {
      expect(@vectormenus.sort_for).to eq([766.8, 1126.8, 1143.84, 1306.8, 1306.8, 1306.8, 1315.32, 1760.4, 2073.6, 2397.6])
    }
    puts Benchmark.measure {
      expect(@vectormenus.sort).to eq([766.8, 1126.8, 1143.84, 1306.8, 1306.8, 1306.8, 1315.32, 1760.4, 2073.6, 2397.6])
    }
  end

  it "Pruebas lista de individuos" do
    @listaindv.insert(@person0)
    @listaindv.insert(@person1)
    @listaindv.insert(@person2)
    @listaindv.insert(@person3)
    @listaindv.insert(@person4)
    @listaindv.insert(@person0)
    @listaindv.insert(@person1)
    @listaindv.insert(@person2)
    @listaindv.insert(@person3)
    @listaindv.insert(@person4)
    puts Benchmark.measure {
      expect(@listaindv.sort_each).to eq([1750.7, 1750.7, 1956.9, 1956.9, 2456.07, 2456.07, 3894.0, 3894.0, 4198.4, 4198.4])
    }
    puts Benchmark.measure {
      expect(@listaindv.sort_for).to eq([1750.7, 1750.7, 1956.9, 1956.9, 2456.07, 2456.07, 3894.0, 3894.0, 4198.4, 4198.4])
    }
    puts Benchmark.measure {
      expect(@listaindv.map{ |x| x.gasto_energetico_total}.sort).to eq([1750.7, 1750.7, 1956.9, 1956.9, 2456.0675, 2456.0675, 3894.0, 3894.0, 4198.4, 4198.4])
    }
  end

  it "Prueba declaracion menu" do
    @menu = Menu.new("Lunes") do
      titulo "Bajo en calorias"

      ingesta :min => 30, :max => 35

      desayuno "Pan de trigo integral",
      :porcion => "1 rodaja",
      :gramos => 100,
      :grasas => 3.3,
      :hidratos => 54.0,
      :proteinas => 11.0,
      :fibra => 2.3,
      :sal => 0.06

      desayuno "Actimel",
      :porcion => "1 porcion",
      :gramos => 100,
      :grasas => 3.4,
      :hidratos => 4.4,
      :proteinas => 3.6,
      :sal => 0.05

      almuerzo "Arroz",
      :porcion => "1 taza",
      :gramos => 100,
      :grasas => 0.9,
      :hidratos => 81.6,
      :proteinas => 6.67,
      :fibra => 1.4,
      :sal => 0.04

      almuerzo  "Lentejas",
      :porcion => "1/2 cucharon",
      :grasas => 0.4,
      :hidratos => 20.0,
      :proteinas => 9.0,
      :fibra => 8.0,
      :sal => 0.02

      almuerzo "Naranja",
      :porcion => "1 pieza",
      :gramos => 100,
      :grasas => 0.12,
      :hidratos => 11.75,
      :proteinas => 0.94,
      :fibra => 2.4

      cena    "Leche entera hacendado",
      :porcion => "1 vaso",
      :gramos => 100,
      :grasas => 3.6,
      :hidratos => 4.6,
      :proteinas => 3.1,
      :sal => 0.13

    end

    puts @menu.to_s
  end
end
