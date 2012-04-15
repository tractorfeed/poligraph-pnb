require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'forma1cand',
    :fields => [
      {:name => "Candidate First Name", :required => true},
      {:name => "Candidate Middle Initial", :required => false},
      {:name => "Candidate Last Name", :required => true},
      {:name => "Office Sought", :required => false},
      {:name => "Office Title", :required => false},
      {:name => "Office Description", :required => false},
      {:name => "hswid", :required => true}
    ],
    :model => { # polimapper only likes string literals
      "address" => [
        # no effing clue
      ],
      "phone" => [
        # nuttin
      ],
      "id" => [
        # don't know anything here
      ],
      "name" => {
        "first"  => "Candidate First Name",
        "middle" => "Candidate Middle Initial",
        "last"   => "Candidate Last Name",
        "full"   => nil
      },
      "misc" => {
        "office_sought" => "Office Sought",
        "office_title" => "Office Title",
        "office_desc" => "Office Description"
      },
      "source" => {
        "doc" => :forma1cand,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
