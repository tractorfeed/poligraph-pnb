require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb11',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Recipient Name", :required=> false},
      {:name => "Recipient Address", :required=> false},
      {:name => "Recipient City", :required=> false},
      {:name => "Recipient State", :required=> false},
      {:name => "Recipient Zip", :required=> false},
      {:name => "Recipient Phone", :required=> false},
      {:name => "Expenditure Date", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Candidate ID", :required=> false},
      {:name => "Candidate Support/Oppose", :required=> false},
      {:name => "Ballot Question ID", :required=> false},
      {:name => "Ballot Support/Oppose", :required=> false},
      {:name => "Date Last Revised", :required=> false},
      {:name => "Last Revised By", :required=> false},
      {:name => "Candidate/Ballot Name", :required=> false}    ],
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
        "doc" => :formb11,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
