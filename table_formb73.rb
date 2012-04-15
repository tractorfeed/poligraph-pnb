require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb73',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Committee ID", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Contributor ID", :required=> false},
      {:name => "Contribution Date", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Nature Of Contribution", :required=> false},
      {:name => "Support/Oppose", :required=> false},
      {:name => "Description", :required=> false},
      {:name => "Microfilm Number", :required=> false},
      {:name => "Contributor Name", :required=> false}    ],
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
        "doc" => :formb73,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
