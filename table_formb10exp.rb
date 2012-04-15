require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb10exp',
    :fields => [
      {:name => "Form B10 ID", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Recipient Name", :required=> false},
      {:name => "Permanent Address", :required=> false},
      {:name => "Permanent City", :required=> false},
      {:name => "Permanent State", :required=> false},
      {:name => "Permanent Zip", :required=> false},
      {:name => "Temporary Address", :required=> false},
      {:name => "Temporary City", :required=> false},
      {:name => "Temporary State", :required=> false},
      {:name => "Temporary Zip", :required=> false},
      {:name => "Expenditure Date", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Description", :required=> false}    ],
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
        "doc" => :formb10exp,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
