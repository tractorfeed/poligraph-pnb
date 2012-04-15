require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb3',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form ID Number", :required=> false},
      {:name => "Committe ID Number", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Agent Name", :required=> false},
      {:name => "Agent Address", :required=> false},
      {:name => "Agent City", :required=> false},
      {:name => "Agent State", :required=> false},
      {:name => "Agent Zip", :required=> false},
      {:name => "Agent Phone", :required=> false},
      {:name => "Contributor Name", :required=> false},
      {:name => "Contributor Address", :required=> false},
      {:name => "Contributor City", :required=> false},
      {:name => "Contributor State", :required=> false},
      {:name => "Contributor Zip", :required=> false},
      {:name => "Contributor Phone", :required=> false},
      {:name => "Contribution Date", :required=> false},
      {:name => "Amount Received", :required=> false},
      {:name => "Nature", :required=> false},
      {:name => "Description of In-Kind", :required=> false},
      {:name => "Transfer Date", :required=> false},
      {:name => "Transfer Amount", :required=> false},
      {:name => "Transfer Nature", :required=> false},
      {:name => "Transfer In-Kind Description", :required=> false},
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
        "doc" => :formb3,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
