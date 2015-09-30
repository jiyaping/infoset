# encoding : utf-8

class Information
  attr_accessor :_info_

  def initialize
    @_info_ = Info.new
    @_info_.name = self.class
  end

  def associate(info)
    @_info_   = info

    init_attribute
  end

  def update(opts = {})
    opts.each do |key, value|
      send(key.to_sym, value)  
    end

    save
  end

  def save
    @_info_.value = to_json

    @_info_.save
  end

  def to_json
    h = {}
    instance_variables.inject(h) do |hash, attr| 
      next if attr == :@_info_
      hash[attr] = send(attr.to_s.sub(/^@/,'').to_sym) 
    end

    h.to_json
  end

  private

  def init_attribute
    attr_hash = @_info_.hash

    attr_hash.each do |key, value|
      instance_eval("self.#{key} = #{value}")
    end
  end
end