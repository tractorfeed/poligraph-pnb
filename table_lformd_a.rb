#Principal ID|Principal Name|Principal Office Address|Principal Office City|Principal Office State|Principal Office Zip|Principal Office Phone|Principal Official Contact|Principal Nature of Business
JOBS = [
  {
    :table => 'lformd',
    :fields => [
      {:name => "Lobbyist Name", :required => true},
      {:name => "Lobbyist Office Address", :required => false},
      {:name => "Lobbyist Office City", :required => true},
      {:name => "Lobbyist Office State", :required => false},
      {:name => "Lobbyist Office Zip", :required => false},
      {:name => "Lobbyist Office Phone", :required => false},
      {:name => "Lobbyist Residence Address", :required => false},
      {:name => "Lobbyist Residence City", :required => false},
      {:name => "Lobbyist Residence State", :required => false},
      {:name => "Lobbyist Residence Zip", :required => false},
      {:name => "Lobbyist Residence Phone", :required => false},      
      {:name => "hswid", :required => true}
    ],
    :model => { # polimapper only likes string literals
      "address" => [
        {
          "type" => :office,
          "street" => "Lobbyist Office Address", 
          "city" => "Lobbyist Office City",
          "state" => "Lobbyist Office State",
          "zip" => "Lobbyist Office Zip"
        },
        {
          "type" => :residence,
          "street" => "Lobbyist Residence Address",
          "city" => "Lobbyist Residence City",
          "state" => "Lobbyist Residence State",
          "zip" => "Lobbyist Residence Zip"
        }
      ],
      "id" => [
        # don't know anything here
      ],
      "phone" => [
        {
          "type" => :office,
          "number" => "Lobbyist Office Phone"
        },
        {
          "type" => :residence,
          "number" => "Lobbyist Residence Phone"
        }
      ],
      "name" => {
        "first"  => nil,
        "middle" => nil,
        "last"   => nil,
        "full"   => "Lobbyist Name"
      },
      "misc" => {
      },
      "source" => {
        "doc" => :lformd,
        "id" => "hswid"
      }
    }
  }
]