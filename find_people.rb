require 'pg'
require './db'

connection = PG::Connection.new(:host => @dbhost, :port => @dbport, :user => @dbuser, :password => @dbpass, :dbname => @dbname)
fml_names = Array.new
single_field_names = Array.new

def conn
  @connection = @connection || PG::Connection.new(:host => @dbhost, :port => @dbport, :user => @dbuser, :password => @dbpass, :dbname => @dbname)
  return connection
end

def a1cand
  res = @connection.exec('SELECT "Candidate Last Name", "Candidate First Name", "Candidate Middle Initial" FROM FORMA1CAND')
  res.each do |row|
    if(res['Candidate First Name'] && res['Candidate Last Name'])
      names.push ({:fname => res['Candidate First Name'].strip, :lname => res['Candidate Last Name'].strip, :mname => res["Candidate Middle Initial"].strip})
    end
  end
end


