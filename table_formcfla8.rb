require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formcfla8',
    :fields => [
      {:name => "Candidate First Name", :required=> false},
      {:name => "Candidate Middle Initial", :required=> false},
      {:name => "Candidate Last Name", :required=> false},
      {:name => "Candidate Address", :required=> false},
      {:name => "Candidate City", :required=> false},
      {:name => "Candidate State", :required=> false},
      {:name => "Candidate Zip", :required=> false},
      {:name => "Candidate Committee Name", :required=> false},
      {:name => "Committee Phone", :required=> false},
      {:name => "Form ID Number", :required=> false},
      {:name => "Candidate ID", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Office Sought", :required=> false},
      {:name => "District", :required=> false},
      {:name => "Business Address", :required=> false},
      {:name => "Business Phone", :required=> false},
      {:name => "Home Phone", :required=> false},
      {:name => "Election Date", :required=> false},
      {:name => "Last Revised Date", :required=> false},
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
        "doc" => :formcfla8,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
