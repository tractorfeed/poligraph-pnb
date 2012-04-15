require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb9',
    :fields => [
      {:name => "Contributor Name", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Contributor ID", :required=> false},
      {:name => "Postmark Date", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Contributor Type", :required=> false},
      {:name => "Date Last Revised", :required=> false},
      {:name => "Last Revised By", :required=> false},
      {:name => "Contributor Phone", :required=> false}    ],
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
        "doc" => :formb9,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
