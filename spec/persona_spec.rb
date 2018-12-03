RSpec.describe Nutricional do

  before :each do
    @person1 = Paciente.new("Marta", Datos.new(180,90,17,"hombre", 105, 130))
    @person2 = Paciente.new("Fer", Datos.new(156, 50, 9, "mujer", 60, 80))
    @person3 = Paciente.new("Oto", Datos.new(179, 112, 57, "hombre", 200, 60))
    @person4 = Paciente.new("Eco", Datos.new(156, 200, 84, "mujer", 110, 100))
    @person0 = Paciente.new("Diego", Datos.new(176, 255, 23, "mujer", 150, 120))
    @person6 = Persona.new("Pepe")
    @lista = Lista.new()
  end

  it "Comprobación clase de un objeto" do
    expect(@person1).to be_a_kind_of(Persona)
    expect(@person1).to be_a_kind_of(Paciente)
    expect(@person1).not_to be_a_kind_of(Tag)
  end

# private_method_defined?
# method_defined?
# ancestors_include?
# ancestors_include?().to eq(true)
# is_a? != instance_of

  it "Comprobacion tipo de clase" do
    expect(@person1).is_a?(Persona)
    expect(@person1).to be_a_kind_of(Paciente)
    expect(@person1).not_to be_a_kind_of(Tag)
  end


  it "Comprobacion funciones" do
      expect(Persona.private_method_defined? (:initialize)).to eq(true)
      expect(Paciente.private_method_defined? (:initialize)).to eq(true)
      expect(Paciente.method_defined? (:devolver_datos)).to eq(true)
      expect(Paciente.method_defined? (:to_s)).to eq(true)
      expect(Persona.method_defined? (:to_s)).to eq(true)
      expect(Paciente.respond_to? (:una_funcion_random)).to eq(false)
      expect(@person1).to respond_to("to_s")
  end

  it "Comprobación jerarquia" do
    # comprobar object y basic object
    expect(@person1.class).to eq(Paciente)
    expect(@person1.class.superclass).to eq(Persona)
    expect(@person1.class.ancestors.include? (Object)).to eq (true)
    expect(@person1.class.ancestors.include? (BasicObject)).to eq (true)
  end

  it "Comprobar clasificación" do
    expect(@lista.insert(@person0)).equal?(Node)
    expect(@lista.insert(@person1)).equal?(Node)
    expect(@lista.insert(@person2)).equal?(Node)
    expect(@lista.insert(@person3)).equal?(Node)
    expect(@lista.insert(@person4)).equal?(Node)
    array = @lista.clasificar_imc
    expect(array[0].length).to eq(2)
    expect(array[1].length).to eq(3)
  end

  it "Pruebas comparable persona <" do
    expect(@person0 < @person2).to be true
  end

  it "Pruebas comparable persona <=" do
    expect(@person0 <= @person2).to be true
  end

  it "Pruebas comparable persona ==" do
    expect(@person0 == @person2).to be false
  end

  it "Pruebas comparable persona >" do
    expect(@person0 > @person2).to be false
  end

  it "Pruebas comparable persona >=" do
    expect(@person0 >= @person2).to be false
  end

  it "Pruebas comparable between" do
    expect(@person3.between?(@person0, @person2)).to be false
    expect(@person4.between?(@person0, @person2)).to be true
  end

end
