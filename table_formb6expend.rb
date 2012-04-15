require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb6expend',
    :fields => [
      {:name => "Committee Name", :required=> false},
      {:name => "Form B6 ID", :required=> false},
      {:name => "Date Received", :required=> false},
      {:name => "Form ID", :required=> false},
      {:name => "Expenditure Date", :required=> false},
      {:name => "Amount", :required=> false},
      {:name => "Description", :required=> false},
      {:name => "Recipient Name", :required=> false},
      {:name => "Recipient Address", :required=> false}    ],
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
        "doc" => :formb6expend,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
