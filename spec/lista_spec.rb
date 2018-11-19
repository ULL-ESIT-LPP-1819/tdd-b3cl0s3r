RSpec.describe Nutricional do

  before :each do
    @etiqueta1 = Tag.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
    @etiqueta2 = Tag.new("Hamburguesa", 500, 63, 0, 2.1, 2.1, 0, 13)
    @etiqueta3 = Tag.new("Pescado", 250, 0, 23, 2.1, 2.1, 0, 19)
    @etiqueta4 = Tag.new("Manzana", 99, 6, 0, 2.1, 2.1, 0, 1)
    @etiqueta5 = Tag.new("Pera", 143, 13, 0, 2.1, 2.1, 0, 3)
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
end
