require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb9b',
    :fields => [
      {:name => "Contributor Name", :required=> false},
      {:name => "Form B9 ID", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Recipient ID", :required=> false},
      {:name => "Support/Oppose", :required=> false},
      {:name => "Nature of Expenditure", :required=> false},
      {:name => "Expenditure Date", :required=> false},
      {:name => "Previous Total", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Total", :required=> false},
      {:name => "Description", :required=> false},
      {:name => "Entry Date", :required=> false},
      {:name => "Recipient Name", :required=> false}    ],
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
        "doc" => :formb9b,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
