class JsonObject
  attr_accessor :info
  def initialize(json)
    @info = json
  end

  def inspect
    info.inspect
  end

  def where(*args)
    binding.pry
  end


  def method_missing(p_missing_method_name)
    key = p_missing_method_name.to_s

    if info.has_key?(key)
      if info[key].is_a? String
        return info[key]
      else
        if info[key].is_a? Array
          return info[key].each.collect { |i|  (i.is_a? String) ? i : JsonObject.new(i) }
        else
          return JsonObject.new(info[key])
        end
      end
    else
      super
    end
  end


end