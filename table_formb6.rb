require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb6',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form ID Number", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Expenditure Name", :required=> false},
      {:name => "Expend Phone", :required=> false},
      {:name => "Expend Address", :required=> false},
      {:name => "Expend City", :required=> false},
      {:name => "Expend State", :required=> false},
      {:name => "Expend Zip", :required=> false},
      {:name => "Election Date", :required=> false},
      {:name => "Recipient Name", :required=> false},
      {:name => "Recipient Address", :required=> false},
      {:name => "Expenditure Date", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Description", :required=> false},
      {:name => "Date Last Revised", :required=> false},
      {:name => "Last Revised By", :required=> false}    ],
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
        "doc" => :formb6,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
