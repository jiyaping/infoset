# encoding : utf-8

class  DataMigration < ActiveRecord::Migration
  def self.up
    create_info unless Info.table_exists?
    create_setx  unless Setx.table_exists?
    create_attachment unless Attachment.table_exists?
  end

  def self.down
    drop_table  :setxs
    drop_table  :infos
    drop_table  :attachments
  end

  def self.create_setx
    create_table :setxs do |t|
      t.string  :name
    end
  end

  def self.create_info
    create_table :infos do |t|
      t.string  :name
      t.string  :value
    end
  end

  def self.create_attachment
    create_table :attachments do |t|
      t.integer :set_id
      t.integer :info_id
    end
  end
end