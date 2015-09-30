# encoding : utf-8

class InformationLoader
  class << self
    def load(path)
      path = File.join(path, '/*')

      Dir[path].each do |item|
        load_rb(item) if item.end_with? '.rb'
      end
    end

    def load_rb(path)
      require path.sub('.rb', '')
      puts "load path:#{path}"
    end
  end 
end