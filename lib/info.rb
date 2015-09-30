# encoding : utf-8

class Info < ActiveRecord::Base
  self.table_name = 'infos'

  has_many  :attachments
  has_many  :setxs, :through => :attachments

  def get_instance
    instance_eval(name.capitalize).send(:build, value)
  end
end