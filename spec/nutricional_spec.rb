RSpec.describe Nutricional do

  before :each do
    @tag = Tag.new("Freeway", 10, 0, 0, 2.1, 2.1, 0, 0.02)
  end

  it "Nombre etiqueta correcto" do
    expect(@tag.nombre).to eq("Freeway")
  end

  it "Valor energético correcto" do
    expect(@tag.venergetico).to eq(10)
  end

  it "Valor cantidad de grasas correcto" do
    expect(@tag.cgrasas).to eq(0)
  end

  it "Valor cantidad de grasas saturadas correcto" do
    expect(@tag.cgsaturadas).to eq(0)
  end

  it "Valor hidratos de carbono correcto" do
    expect(@tag.hidratos).to eq(2.1)
  end

  it "Valor azúcares correcto" do
    expect(@tag.azucares).to eq(2.1)
  end

  it "Proteinas" do
    expect(@tag.proteinas).to eq(0)
  end

  it "Sal" do
    expect(@tag.sal).to eq(0.02)
  end
end
