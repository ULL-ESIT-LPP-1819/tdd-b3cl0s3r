Node = Struct.new(:value, :next, :prev)

class Lista
  attr_accessor :head, :tail
  include Comparable,Enumerable

  # Constructor

  def initialize()
    @head = nil
    @tail = nil
  end

  # Insertar en la lista

  def insert(etiqueta)
    nodo = Node.new(etiqueta, nil, nil)

    if self.empty
      nodo.next=nodo
      nodo.prev=nodo
      @head=nodo
      @tail=nodo

    else
      nodo.prev = @tail
      nodo.next = nil
      @tail.next = nodo
      @tail = nodo
    end
  end

  # Sacar de la lista

  def pop
    if @head == nil
      return nil
    elsif @tail == @head
      @tail = nil
      @head = nil
    else
      aux = @tail
      @tail = aux.prev
      @tail.next = nil
      return aux
    end

  end

  # Desplazar en la lista

  def shift
    if self.empty
      return nil
    else
      if @tail == @head
        @tail = nil
        @head = nil
      else
        @head = @head.next
        return @head
      end
    end
  end

  # Imprimir lista

  def to_s
    node = @head
    a = ""
    while !(node.nil?)
      a += node.value.to_s
      node=node.next
    end
    return a
  end

  # Calcular tamaño lista

  def tamañolista
    size = 0
    node = @head
    while !(node.nil?)
      node=node.next
      size+=1
    end
    return size
  end

  # ¿esta la lista vacia?

  def empty
    @head.nil?
  end

  # Clasificar segun sales

  def clasificar_sales

    devolver = []
    l1 = []
    l2 = []
    node = @head

    while !(node.nil?)
      if node.value.sal < 6
        l1.append(node.value.sal)
      else
        l2.append(node.value.sal)
      end
      node=node.next
    end

    devolver.append(l1, l2)
  end

  # Clasificar segun imc

  def clasificar_imc

    devolver = []
    l1 = []
    l2 = []
    node = @head

    while !(node.nil?)
      if node.value.datos.imc < 30
        l1.append(node.value.datos.imc)
      else
        l2.append(node.value.datos.imc)
      end
      node=node.next
    end

    devolver.append(l1, l2)
  end

  # Recorrer each

  def each
    node = @head
    while !(node.nil?)
      yield node.value
      node = node.next
    end
  end


  def sort_for

    @temp = self.map{|x| x.gasto_energetico_total.round(2)}
    lista_ordenada=[]
    lista_ordenada.push(@temp[0])
    for i in (1..length - 1)
      a=@temp[i]
      for j in (0..i)
        if(lista_ordenada[j]>=a)
          lista_ordenada.insert(j,a)
          break
        elsif(lista_ordenada[lista_ordenada.size-1] <= a)
          lista_ordenada.push(a)
          break
        end
      end
    end
    return lista_ordenada

  end

  def sort_each

    @temp  = self.map{ |x| x.gasto_energetico_total.round(2)}

    i=0
    @temp.each do |x|
      a=x
      i1=i
      j=i1+1
      @temp[j..@temp.length-1].each do |y|
        if a > y
          a = y
          i1 = j
        end
        j+=1
      end
      @temp[i1]=x
      @temp[i]=a
      i+=1
    end
    @temp
  end

  def length
    size = 0
    node = @head
    while !(node.nil?)
      size = size + 1
      node = node.next
    end
    size
  end




  # Clasificar por hidratos

  def clasf_hidratos
    lista=[]

    current_node=@head
    while(!current_node.nil?)
      lista.append(current_node.value.hidratos)
      current_node=current_node.next
    end
    return lista
  end

  # Clasificar por peso

  def clasf_peso
    lista=[]
    current_node=@head

    while(!current_node.nil?)
      lista.append(current_node.value.imc.round(1))
      current_node=current_node.next
    end
    return lista
  end

  def clasf_et
    lista=[]
    current_node=@head

    while(!current_node.nil?)
      lista.append(current_node.calcularkcal)
      current_node=current_node.next
    end
    return lista
  end
end
