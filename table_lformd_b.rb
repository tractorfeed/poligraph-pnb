JOBS = [
  {
    :table => 'lformd',
    :fields => [
      #Principal Name|Principal Office Address|Principal Office City|Principal Office State|Principal Office Zip|Principal Office Phone|Principal Official Contact|Principal Nature of Business
      {:name => "Principal Name", :required => true},
      {:name => "Principal Office Address", :required => true},
      {:name => "Principal Office City", :required => true},
      {:name => "Principal Office State", :required => true},
      {:name => "Principal Office Zip", :required => true},
      {:name => "Principal Office Phone", :required => true},
      {:name => "hswid", :required => true}
    ],
    :model => { # polimapper only likes string literals
      "address" => [
        {
          "type" => :office,
          "street" => "Principal Office Address", 
          "city" => "Principal Office City",
          "state" => "Principal Office State",
          "zip" => "Principal Office Zip"
        }
      ],
      "id" => [
        # don't know anything here
      ],
      "phone" => [
        {
          "type" => :office,
          "number" => "Principal Office Phone"
        }
      ],
      "name" => {
        "first"  => nil,
        "middle" => nil,
        "last"   => nil,
        "full"   => "Principal Name"
      },
      "misc" => {
        "principal_official_contact" => "Principal Official Contact",
        "principal_nature_of_business" => "Principal Nature of Business",
      },
      "source" => {
        "doc" => :lformd,
        "id" => "hswid"
      }
    }
  }
]