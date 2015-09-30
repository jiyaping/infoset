# encoding : utf-8

class Information
  attr_accessor :fields, :info

  def initialize(args)
    info = args

    create_attr
  end

  def to_json
    fields.to_json
  end

  def build(json_str)
    fields = JOSN.parse(json_str)
  end

  def create_attr
    
    fields.each do |attr, value|
      unless self.respond_to? attr.to_sym
        instance_eval("def #{attr}; @#{attr}; end")
        instance_eval("def #{attr}=(x); @#{attr} = x; end")
      else
        send(attr, value)
      end
    end
  end
end