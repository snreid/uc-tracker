class JsonObject
  attr_accessor :info
  def initialize(json)
    @info = json
  end

  def inspect
    info.inspect
  end


  def method_missing(p_missing_method_name)

    key = p_missing_method_name.to_s

    if info.has_key?(key)
      if info[key].is_a? Array
        info[key].each.collect { |i| JsonObject.new(i) }
      else
        JsonObject.new(info[key])
      end
    else
      super
    end
  end


end