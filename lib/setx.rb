# encoding : utf-8

class Setx < ActiveRecord::Base
  self.table_name = 'setxs'
  
  has_many  :attachments
  has_many  :infos, :through => :attachments

  attr_accessor :informations

  def informations 
    informations = []

    infos.each do |info|
      informations << info.get_instance
    end
  end
end