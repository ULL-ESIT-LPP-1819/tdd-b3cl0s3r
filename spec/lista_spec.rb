RSpec.describe Lista do

  before :each do
    etiqueta1 = Tag.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
    etiqueta2 = Tag.new("Hamburguesa", 500, 63, 0, 2.1, 2.1, 0, 13)
    etiqueta3 = Tag.new("Pescado", 250, 0, 23, 2.1, 2.1, 0, 19)
    etiqueta4 = Tag.new("Manzana", 99, 6, 0, 2.1, 2.1, 0, 1)
    etiqueta5 = Tag.new("Pera", 143, 13, 0, 2.1, 2.1, 0, 3)
    nodo1 = Node.new(etiqueta1, nil, nil)
    nodo2 = Node.new(etiqueta1, nil, nil)
    nodo3 = Node.new(etiqueta1, nil, nil)
    nodo4 = Node.new(etiqueta1, nil, nil)
    nodo5 = Node.new(etiqueta1, nil, nil)
    lista = Pene.new()
  end

  it "Push correcto" do
    expect(@tag.nombre).to eq("Freeway")

    lista.push(nodo1)
    lista.push(nodo2)
    lista.push(nodo3)
    lista.push(nodo4)
    lista.push(nodo5)
  end

end
