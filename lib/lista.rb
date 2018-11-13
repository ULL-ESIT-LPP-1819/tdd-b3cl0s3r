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
       @head=nodo
       @tail=nodo
     else
       nodo.prev = @tail
       nodo.next = nil
       @tail.next = nodo
       tail = nodo
     end
  end

  def pop
    if self.empty
      return nil
    else
      @tail = @tail.prev
      return @tail
    end
  end

  def shift
    if self.empty
      return nil
    else
      @head = @head.next
      return @head
    end
  end

  def recorrer
    node = @head
    while !(node.nil?)
      node.value.to_s
      node=node.next
    end
  end

  def empty
    @head.nil?
  end
end
