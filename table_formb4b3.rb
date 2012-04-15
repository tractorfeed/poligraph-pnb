require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb4b3',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Payee Name", :required=> false},
      {:name => "Payee Address", :required=> false},
      {:name => "Purpose Of Disbursement", :required=> false},
      {:name => "Date of Disbursement", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Expense Category", :required=> false}    ],
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
        "doc" => :formb4b3,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
