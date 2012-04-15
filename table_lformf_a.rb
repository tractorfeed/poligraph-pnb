JOBS = [
  {
    :table => 'lformf',
    :fields => [
      #Principal Name|Principal Office Address|Principal Office City|Principal Office State|Principal Office Zip|Principal Office Phone|Principal Official Contact|Principal Nature of Business
      {:name => "Lobbyist Name", :required => true},
      {:name => "Lobbyist Office Address", :required => true},
      {:name => "Lobbyist Office City", :required => true},
      {:name => "Lobbyist Office State", :required => true},
      {:name => "Lobbyist Office Zip", :required => true},
      {:name => "Lobbyist Office Phone", :required => true},
      {:name => "Lobbyist Residence Address", :required => true},
      {:name => "Lobbyist Residence City", :required => true},
      {:name => "Lobbyist Residence State", :required => true},
      {:name => "Lobbyist Residence Zip", :required => true},
      {:name => "Lobbyist Residence Phone", :required => true},
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
        "doc" => :lformf,
        "id" => "hswid"
      }
    }
  }
]