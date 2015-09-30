# encoding : utf-8

class Attachment < ActiveRecord::Base
  self.table_name = 'attachments'

  belongs_to  :info
  belongs_to  :setx
end