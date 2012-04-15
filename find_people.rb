require 'yaml'
require 'pg'
require './db'

connection = false
fml_names = Array.new
single_field_names = Array.new

def conn
  @connection = @connection || PG::Connection.new(YAML.load_file('./db.yml'))
  return @connection
end

def a1cand
  names = []
  result = conn.exec('SELECT "Candidate Last Name", "Candidate First Name", "Candidate Middle Initial" FROM FORMA1CAND')
  result.each do |res|
    unless(res['Candidate First Name'].nil? || res['Candidate Last Name'].nil?)
      names.push ({:fname => res['Candidate First Name'].strip, :lname => res['Candidate Last Name'].strip, :mname => (res["Candidate Middle Initial"].nil? ? "" : res["Candidate Middle Initial"].strip)})
    end
  end
  return names
end


