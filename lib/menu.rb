class Menu

  def initialize(nombre, &block)

    @nombre = nombre

    @desayuno = []
    @almuerzo = []
    @cena = []



    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval(&block)
      end
    end

  end


  def titulo(name)
    @titulo = name
  end

  def ingesta(options = {} )

    @min = (options[:min]) if options[:min]
    @max = (options[:max]) if options[:max]

  end

  def valor_energetico_total

    @valor_energetico = @desayuno.map{|x| x.calcularkcal}.reduce(:+)
    @valor_energetico += @almuerzo.map{|x| x.calcularkcal}.reduce(:+)
    @valor_energetico += @cena.map{|x| x.calcularkcal}.reduce(:+)

  end

  def desayuno(descripcion, options = {})

    venerg = options[:venerg] ? options[:venerg] : 0.0
    grasas = options[:grasas] ? options[:grasas] : 0.0
    grasas_s =  options[:grasas_s] ? options[:grasas_s] : 0.0
    hidratos = options[:hidratos] ? options[:hidratos] : 0.0
    azucares = options[:azucares] ? options[:azucares] : 0.0
    proteinas = options[:proteinas] ? options[:proteinas] : 0.0
    sal = options[:sal] ? options[:sal] : 0.0
    vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
    minerales = options[:minerales] ? options[:minerales] : 0.0

    etiqueta = Tag.new(descripcion, venerg, grasas, grasas_s, hidratos, azucares, proteinas, sal)
    etiqueta.calcularkcal()

    @desayuno << etiqueta
  end


  def almuerzo(descripcion ,options = {})

    venerg = options[:venerg] ? options[:venerg] : 0.0
    grasas = options[:grasas] ? options[:grasas] : 0.0
    grasas_s =  options[:grasas_s] ? options[:grasas_s] : 0.0
    hidratos = options[:hidratos] ? options[:hidratos] : 0.0
    azucares = options[:azucares] ? options[:azucares] : 0.0
    proteinas = options[:proteinas] ? options[:proteinas] : 0.0
    sal = options[:sal] ? options[:sal] : 0.0
    vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
    minerales = options[:minerales] ? options[:minerales] : 0.0

    etiqueta = Tag.new(descripcion, venerg, grasas, grasas_s, hidratos, azucares, proteinas, sal)
    etiqueta.calcularkcal()

    @almuerzo << etiqueta

  end

  def cena(descripcion, options = {})

    venerg = options[:venerg] ? options[:venerg] : 0.0
    grasas = options[:grasas] ? options[:grasas] : 0.0
    grasas_s =  options[:grasas_s] ? options[:grasas_s] : 0.0
    hidratos = options[:hidratos] ? options[:hidratos] : 0.0
    azucares = options[:azucares] ? options[:azucares] : 0.0
    proteinas = options[:proteinas] ? options[:proteinas] : 0.0
    sal = options[:sal] ? options[:sal] : 0.0
    vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
    minerales = options[:minerales] ? options[:minerales] : 0.0

    etiqueta = Tag.new(descripcion, venerg, grasas, grasas_s, hidratos, azucares, proteinas, sal)
    etiqueta.calcularkcal()

    @cena << etiqueta

  end


  def to_s
    output = "\n\n" << @nombre
    output << "                    Composición nutricional"
    output << "\n#{'=' * 150}\n\n"
    output << "Desayuno\n"
    output << @desayuno.join
    output << "\nAlmuerzo\n"
    output << @almuerzo.join
    output << "\nCena\n"
    output << @cena.join
    output << "\n#{'=' * 150}\n\n"
    output << "Valor energético total:  #{valor_energetico_total.round(2)}\t Ingesta mix: #{@min}\tIngesta max: #{@max}\n\n"
  end
end
