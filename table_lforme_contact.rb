require './polimapper'
require 'json'
JOBS = [
  {
    :table => :lforme,
    :fields => [
    # just Official Contact info
      {:name => "Principal Official Contact", :required=> false}
    ],
    :model => { # polimapper only likes string literals
            "name" => {
              "full" => "Principal Official Contact"
            },
            "address" => [],
            "phone" => [],
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
