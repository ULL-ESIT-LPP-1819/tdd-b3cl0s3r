RSpec.describe Nutricional do

  before :each do
    @etiqueta1 = Tag.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
    @etiqueta2 = Tag.new("Hamburguesa", 500, 63, 0, 2.1, 2.1, 0, 13)
    @etiqueta3 = Tag.new("Pescado", 250, 0, 23, 2.1, 2.1, 0, 19)
    @etiqueta4 = Tag.new("Manzana", 99, 6, 0, 2.1, 2.1, 0, 1)
    @etiqueta5 = Tag.new("Pera", 143, 13, 0, 2.1, 2.1, 0, 3)

    @datos1 = Datos.new(180,90,17,"hombre", 105, 130)
    @datos2 = Datos.new(156, 50, 9, "mujer", 60, 80)
    @datos3 = Datos.new(179, 112, 57, "hombre", 200, 60)
    @datos4 = Datos.new(156, 200, 84, "mujer", 110, 100)
    @datos5 = Datos.new(176, 255, 23, "mujer", 150, 120)

    @lista = Lista.new()
  end

  it "Insert correcto" do
    expect(@lista.insert(@etiqueta1)).equal?(Node)
    expect(@lista.insert(@etiqueta2)).equal?(Node)
    expect(@lista.empty).to be false
  end

  it "Pop correcto" do
    expect(@lista.insert(@etiqueta1)).equal?(Node)
    expect(@lista.empty).to be false
    expect(@lista.pop).equal?(Node)
    expect(@lista.empty).to be true
  end

  it "Shift correcto" do
    expect(@lista.insert(@etiqueta1)).equal?(Node)
    expect(@lista.empty).to be false
    expect(@lista.shift).equal?(Node)
    expect(@lista.empty).to be true
  end

  it "To_s correcto" do
    expect(@lista.insert(@etiqueta1)).equal?(Node)
    expect(@lista.insert(@etiqueta2)).equal?(Node)
    expect(@lista.insert(@etiqueta3)).equal?(Node)
    expect(@lista.insert(@etiqueta4)).equal?(Node)
    expect(@lista.insert(@etiqueta5)).equal?(Node)
    expect(@lista.to_s).equal?(String)
    expect(@lista.tamañolista).to eq(5)
    expect(@lista.pop).equal?(Node)
    expect(@lista.tamañolista).to eq(4)
    expect(@lista.insert(@etiqueta5)).equal?(Node)
    expect(@lista.tamañolista).to eq(5)
  end

  it "Clasificar sales" do
    expect(@lista.insert(@etiqueta1)).equal?(Node)
    expect(@lista.insert(@etiqueta2)).equal?(Node)
    expect(@lista.insert(@etiqueta3)).equal?(Node)
    expect(@lista.insert(@etiqueta4)).equal?(Node)
    expect(@lista.insert(@etiqueta5)).equal?(Node)
    array = @lista.clasificar_sales
    ## Array 0 contiene valores menores que 6
    expect(array[0].length).to eq(3)
    ## Array 1 contiene valores mayores que 6
    expect(array[1].length).to eq(2)
  end



  it "Prueba metodos select min max sort collect para clasificar hidratos" do
    @lista.add_at_final(@etiqueta1)
    @lista.add_at_final(@etiqueta2)
    @lista.add_at_final(@etiqueta3)
    @lista.add_at_final(@etiqueta4)
    @lista.add_at_final(@etiqueta5)
    expect(@lista.clasf_hidratos.select).to eq(4)
    expect(@lista.clasf_hidratos.min).to eq(18.9)
    expect(@lista.clasf_hidratos.max).to eq(52.1)
    expect(@lista.clasf_hidratos.sort).to eq([18.9,20.8,25.8,52.1])
    expect(@lista.clasf_hidratos.collect {|i| (i*i).round(2) }).to eq([665.64,357.21,432.64,2714.41])
  end

 it "Prueba metodos count min max sort collect para clasificar por peso" do
    @lista.add_at_final(@datos1)
    @lista.add_at_final(@datos2)
    @lista.add_at_final(@datos3)
    @lista.add_at_final(@datos4)
    @lista.add_at_final(@datos5)
    expect(@lista.clasf_peso.select { |num| num.round(2) > 85.0 }).to eq([95.5,98.4,85.3])
    expect(@lista.clasf_peso.sort).to eq([74,85.3,95.5,98.4])
    expect(@lista.clasf_peso.collect {|i| (i*i).round(2) }).to eq([9120.25,5476,9682.56,7276.09])
    expect(@lista.clasf_peso.min).to eq(74)
    expect(@lista.clasf_peso.max).to eq(98.4)
  end

end
