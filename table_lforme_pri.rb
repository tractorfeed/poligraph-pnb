require './polimapper'
require 'json'
JOBS = [
  {
    :table => 'lforme',
    :fields => [
    # just principal info
      {:name => "Principal Name", :required=> false},
      {:name => "Principal Office Address", :required=> false},
      {:name => "Principal Office City", :required=> false},
      {:name => "Principal Office State", :required=> false},
      {:name => "Principal Office Zip", :required=> false},
      {:name => "Principal Office Phone", :required=> false}
    ],
    :model => { # polimapper only likes string literals
            "name" => {
              "full" => "Principal Name"
            },
            "address" => [
              {
              "type" => :office,
              "street" => "Principal Office Address",
              "city" => "Principal Office City",
              "state" => "Principal Office State",
              "zip" => "Principal Office Zip"
              }
                         ],
      "phone" => [
                  {
        "type"  => :office,
        "number" => "Principal Office Phone"
                  }
                 ],
      "source" => {
        "doc" => :lforme,
        "id" => "hswid"
      }
    }
  }
]

JOBS.each do |job|
  puts PoliMapper.fill_model(job[:table], job[:model], job[:fields]).to_json
end
