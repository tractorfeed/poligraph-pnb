require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb10',
    :fields => [
      {:name => "Form ID", :required=> false},
      {:name => "Entity ID", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Permanent Phone", :required=> false},
      {:name => "Temporary Address", :required=> false},
      {:name => "Temporary City", :required=> false},
      {:name => "Temporary State", :required=> false},
      {:name => "Temporary Zip", :required=> false},
      {:name => "Temporary Phone", :required=> false},
      {:name => "Date Last Revised", :required=> false},
      {:name => "Last Revised By", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Entity Orginzation Name", :required=> false},
      {:name => "Entity First Name", :required=> false},
      {:name => "Entity Middle Initial", :required=> false},
      {:name => "Entity Last Name", :required=> false},
      {:name => "Committee Name", :required=> false}    ],
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
        "doc" => :formb10,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
