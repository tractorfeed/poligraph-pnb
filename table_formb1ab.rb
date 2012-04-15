require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'formb1ab',
    :fields => [
#Committee Name|Committee ID|Date Received|Type of Contributor|Contributor ID|Contribution Date|Cash Contribution|In-Kind Contribution|Unpaid Pledges|Contributor Last Name|Contributor First Name|Contributor Middle Initial|Contributor Organization Name|Contributor Address|Contributor City|Contributor State|Contributor Zipcode
    ],
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
        "doc" => :formb1ab,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
