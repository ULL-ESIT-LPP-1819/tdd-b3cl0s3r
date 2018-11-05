RSpec.describe Nutricional do

  before :each do
    @tag = Point.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
  end

  it "Nombre etiqueta correcto" do
    expect(@p1.nombre).to eq("Freeway")
  end

  it "Valor energético correcto" do
    expect(@p1.nombre).to eq(10)
  end

  it "Valor cantidad de grasas correcto" do
    expect(@p1.nombre).to eq(0)
  end

  it "Valor cantidad de grasas saturadas correcto" do
    expect(@p1.nombre).to eq(0)
  end

  it "Valor hidratos de carbono correcto" do
    expect(@p1.nombre).to eq(2.1)
  end

  it "Valor azúcares correcto" do
    expect(@p1.nombre).to eq("Freeway")
  end

  it "Proteinas" do
    expect(@p1.nombre).to eq("Freeway")
  end

  it "Sal" do
    expect(@p1.nombre).to eq("Freeway")
  end
end

