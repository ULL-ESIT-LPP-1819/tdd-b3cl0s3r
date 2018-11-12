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

  it "Monoinsaturadas" do
    @tag.monoinsat = 1
    expect(@tag.monoinsat).to eq(1)
  end

  it "Polialcoles" do
    @tag.polialcol = 1
    expect(@tag.polialcol).to eq(1)
  end

  it "Almidon" do
    @tag.almidon = 1
    expect(@tag.almidon).to eq(1)
  end

  it "Fibra" do
    @tag.almidon = 1
    expect(@tag.almidon).to eq(1)
  end

  it "Calculo kJ/g" do
    expect(@tag.calcularkj).to eq(36.2)
  end

  it "Calculo kcal/g" do
    expect(@tag.calcularkcal).to eq(8.52)
  end

  it "Calculo IR de los azucares" do
    expect(@tag.calcularir(@tag.azucares)).to eq(15)
  end

  it "Mostrar etiqueta" do
    expect(@tag.to_s).equal?(String)
  end

  it "Mostrar IR de referencia" do
    expect(@tag.irref).to eq(nil)
  end
end
