require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'loblatefile',
    :fields => [
      {:name => "ID", :required=> false},
      {:name => "Lobbyist Last Name", :required=> false},
      {:name => "Lobbyist First Name", :required=> false},
      {:name => "Principal Name", :required=> false},
      {:name => "Statement Due", :required=> false},
      {:name => "Due Date", :required=> false},
      {:name => "Date Filed", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Status", :required=> false},
      {:name => "Reduced", :required=> false},
      {:name => "Order Signed", :required=> false},
      {:name => "Date Paid", :required=> false},
      {:name => "Interest Paid", :required=> false}
    ],
    :model => { # polimapper only likes string literals
      "foo" => [
        # no effing clue
      ],
      "bar" => {
        "bax"  => "Name of Column From Above",
        "bay" => "Name of Column From Above 2",
        "baz"   => "Name of Column From Above 3",
        "lookmaanil"   => nil
      },
      "misc" => {
        "office_sought" => "Office Sought",
        "office_title" => "Office Title",
        "office_desc" => "Office Description"
      },
      "source" => {
        "doc" => :loblatefile,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
