require './polimapper'
require 'json'
JOBS = [
  {
    :table => :lforme,
    :fields => [
           
      # {:name => "Document ID", :required=> false},
      # {:name => "Date Received", :required=> false},
      # {:name => "Postmark Date", :required=> false},
      # {:name => "Nature Of Exemption", :required=> false},
      # {:name => "Lobbyist ID", :required=> false},
      {:name => "Lobbyist Name", :required=> false},
      {:name => "Lobbyist Office Address", :required=> false},
      {:name => "Lobbyist Office City", :required=> false},
      {:name => "Lobbyist Office State", :required=> false},
      {:name => "Lobbyist Office Zip", :required=> false},
      {:name => "Lobbyist Office Phone", :required=> false},
      {:name => "Lobbyist Residence Address", :required=> false},
      {:name => "Lobbyist Residence City", :required=> false},
      {:name => "Lobbyist Residence State", :required=> false},
      {:name => "Lobbyist Residence Zip", :required=> false},
      {:name => "Lobbyist Residence Phone", :required=> false},
      # {:name => "Principal ID", :required=> false},
      # {:name => "Principal Name", :required=> false},
      # {:name => "Principal Office Address", :required=> false},
      # {:name => "Principal Office City", :required=> false},
      # {:name => "Principal Office State", :required=> false},
      # {:name => "Principal Office Zip", :required=> false},
      # {:name => "Principal Office Phone", :required=> false},
      # {:name => "Principal Official Contact", :required=> false},
      # {:name => "Principal Nature of Business", :required=> false}
    ],
    :model => { # polimapper only likes string literals
            "name" => {
              "full" => "Lobbyist Name"
            }
            "address" => [
              {
              "type" => :residence,
              "street" => "Lobbyist Residence Address",
              "city" => "Lobbyist Residence City",
              "state" => "Lobbyist Residence State",
              "zip" => "Lobbyist Residence Zip"
              },
              {
              "type" => :office,
              "street" => "Lobbyist Office Address",
              "city" => "Lobbyist Office City",
              "state" => "Lobbyist Office State",
              "zip" => "Lobbyist Office Zip"
              }
                        ],
      "phone" => [
                  {
        "type"  => :office,
        "number" => "Lobbyist Office Phone"
                  },
                  {
                    "type" => :residence,
                    "number" => "Lobbyist Residence Phone"
                  },
                 ],
      "source" => {
        "doc" => :lforme,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
