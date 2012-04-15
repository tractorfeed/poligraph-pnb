require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb6cont',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form B6 ID", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Contributor Name", :required=> false},
      {:name => "Contributor Address", :required=> false},
      {:name => "Occupation", :required=> false},
      {:name => "Place Of Business", :required=> false},
      {:name => "Employer", :required=> false}    ],
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
        "doc" => :formb6cont,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
