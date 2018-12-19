class Array


  def sort_for

    tmp = self.map{|x| x.reduce(:+)}
    return tmp
    orden = []
    orden.push(tmp[0])

    for i in (1..length - 1)
      a = tmp[i]
      for j in (0..i)

        if (a < orden[j])
          orden.insert(j,a)
          break
        elsif (orden[(orden.length)-1] <= a)
          orden.push(a)
          break
        end
      end
    end

    return orden

  end

  def sort_each

   return self.map{ |x|}

    lista_ord = []
    i = 0
    @temp.each do |x|
      a = x
      i1 = i
      j = i1+1

      @temp[j..temp.length-1].each do |y|
        if (a > y)
          a = y
          i1 = j
        end
        j+=1
      end

      @temp[i1] = x
      @temp[i]=a
      i+=1
    end
    @temp

  end


end
