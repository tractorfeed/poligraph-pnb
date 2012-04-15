require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb9a',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form B9 ID", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Contributor ID", :required=> false},
      {:name => "Occupation", :required=> false},
      {:name => "Employer", :required=> false},
      {:name => "Previous Contributions", :required=> false},
      {:name => "Cash Contribution", :required=> false},
      {:name => "In-Kind Contribution", :required=> false},
      {:name => "Unpaid Pledges", :required=> false},
      {:name => "Total Contribution", :required=> false},
      {:name => "Entry Date", :required=> false},
      {:name => "Contributor Organization Name", :required=> false},
      {:name => "Contributor Last Name", :required=> false},
      {:name => "Contributor First Name", :required=> false},
      {:name => "Contributor Middle Initial", :required=> false}    ],
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
        "doc" => :formb9a,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
