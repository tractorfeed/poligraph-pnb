require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'lformcc',
    :fields => [
      # {:name => "Document ID", :required=> false},
      # {:name => "Date Received", :required=> false},
      # {:name => "Postmark Date", :required=> false},
      # {:name => "Year Covered", :required=> false},
      # {:name => "Month Covered", :required=> false},
      # {:name => "Receipts And Expenditures 1", :required=> false},
      # {:name => "Receipts And Expenditures 2", :required=> false},
      # {:name => "Summary Line 1", :required=> false},
      # {:name => "Summary Line 2", :required=> false},
      # {:name => "Summary Line 3A", :required=> false},
      # {:name => "Summary Line 3B", :required=> false},
      # {:name => "Summary Line 3C", :required=> false},
      # {:name => "Summary Line 3D", :required=> false},
      # {:name => "Summary Line 4", :required=> false},
      # {:name => "Summary Line 5", :required=> false},
      # {:name => "Summary Line 6", :required=> false},
      # {:name => "Summary Line 7", :required=> false},
      # {:name => "Summary Line 8", :required=> false},
      # {:name => "Summary Line 9A", :required=> false},
      # {:name => "Summary Line 9B", :required=> false},
      # {:name => "Summary Line 9C", :required=> false},
      # {:name => "Summary Line 9D", :required=> false},
      # {:name => "Summary Line 10A", :required=> false},
      # {:name => "Summary Line 10B", :required=> false},
      # {:name => "Summary Line 10C", :required=> false},
      # {:name => "Summary Line 10D", :required=> false},
      # {:name => "Summary Line 11", :required=> false},
      # {:name => "Other Info", :required=> false},
      # {:name => "Lobbyist ID", :required=> false},
      # {:name => "Lobbyist Name", :required=> false},
      # {:name => "Lobbyist Office Address", :required=> false},
      # {:name => "Lobbyist Office City", :required=> false},
      # {:name => "Lobbyist Office State", :required=> false},
      # {:name => "Lobbyist Office Zip", :required=> false},
      # {:name => "Lobbyist Office Phone", :required=> false},
      # {:name => "Lobbyist Residence Address", :required=> false},
      # {:name => "Lobbyist Residence City", :required=> false},
      # {:name => "Lobbyist Residence State", :required=> false},
      # {:name => "Lobbyist Residence Zip", :required=> false},
      # {:name => "Lobbyist Residence Phone", :required=> false}
      # {:name => "Principal ID", :required=> false},
      # {:name => "Principal Name", :required=> false},
      # {:name => "Principal Office Address", :required=> false},
      # {:name => "Principal Office City", :required=> false},
      # {:name => "Principal Office State", :required=> false},
      # {:name => "Principal Office Zip", :required=> false},
      # {:name => "Principal Office Phone", :required=> false},
      {:name => "Principal Official Contact", :required=> false},
      # {:name => "Principal Nature of Business", :required=> false}
    ],
    :model => { # polimapper only likes string literals

            "name" => {
              "full" => "Principal Official Contact"
            },
            "address" => [],
            "phone" => [],

      "source" => {
        "doc" => :lformcc,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
