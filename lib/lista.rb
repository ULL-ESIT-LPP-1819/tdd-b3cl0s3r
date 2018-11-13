Node = Struct.new(:value, :next, :prev)

class Lista
  attr_accessor :head, :tail

  def initialize()
     @head = nil
     @tail = nil
  end

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

  def recorrer
    node = @head
    while !(node.nil?)
      puts node.value.to_s
      node=node.next
    end
  end

  def tamañolista
    size = 0
    node = @head
    while !(node.nil?)
      node=node.next
      size+=1
    end
    return size
  end

  def empty
    @head.nil?
  end

  def clasificar

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
end
