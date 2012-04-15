require 'pg'
require 'yaml'

class PoliMapper
  def self.conn
    @connection = @connection || PG::Connection.new(YAML.load_file('./db.yml'))
    return @connection
  end
  
  def self.fill_model(table, model, fields, where=nil)
  
    mapped_objects = Array.new
    
    # assume we're not evil
    query = "SELECT "
    not_first = false
    fields.each do |field|
      query = query + "\"#{field[:name]}\", "
    end
    query = query.slice(0, query.length - 2)
    query = query + " FROM \"#{table}\" "

    unless where.nil?
      query = query + " WHERE #{where}"
    end
    
    # run this puppy
    puts query
    results = conn.exec(query)
    results.each do |row|
      complete = true
      fields.each do |field|
        if(row[field].nil? && (field.has_key? :required && field[:required]))
          complete = false
          puts "skipped row"
          break
        end
      end
      if(complete)
        mapped_objects.push(map(model, row))
      end
    end

    return mapped_objects
  end
  
  def self.map(model, data)
    res = nil
    if(model.nil?)
      res = nil
    elsif(model.kind_of? Array)
      res = map_arr(model, data)
    elsif(model.kind_of? Hash)
      res = map_hash(model, data)
    elsif(model.kind_of? String)
      res = map_string(model, data)
    elsif(model.kind_of? Symbol)
      res = map_symbol(model, data)
    end
    return res
  end
  
  def self.map_arr(model, data)
    res = Array.new
    model.each do |part|
      res.push map(part, data)
    end
    return res
  end
  
  def self.map_hash(model, data)
    res = Hash.new
    model.keys.each do |key|
      res.store(key, map(model[key], data))
    end
    return res
  end
  
  def self.map_string(model, data)
    return data[model].to_s
  end

  def self.map_symbol(model, data)
    return model
  end
end
