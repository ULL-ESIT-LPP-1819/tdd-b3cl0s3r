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
    expect(@lista.insert(@etiqueta3)).equal?(Node)
    expect(@lista.insert(@etiqueta4)).equal?(Node)
    expect(@lista.insert(@etiqueta5)).equal?(Node)
  end
end
