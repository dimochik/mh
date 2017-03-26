module CommunityHelper
  STATES = {
      AK: "Alaska",
      AL: "Alabama",
      AR: "Arkansas",
      AS: "American Samoa",
      AZ: "Arizona",
      CA: "California",
      CO: "Colorado",
      CT: "Connecticut",
      DC: "District of Columbia",
      DE: "Delaware",
      FL: "Florida",
      GA: "Georgia",
      GU: "Guam",
      HI: "Hawaii",
      IA: "Iowa",
      ID:
          {
              "Blackfoot": [
                  "Bingham"
              ],
              "Boise City": [
                  "Ada",
                  "Boise",
                  "Canyon",
                  "Gem",
                  "Owyhee"
              ],
              "Burley": [
                  "Cassia",
                  "Minidoka"
              ],
              "Coeur d'Alene": [
                  "Kootenai"
              ],
              "Hailey": [
                  "Blaine",
                  "Camas",
                  "Lincoln"
              ],
              "Idaho Falls": [
                  "Bonneville",
                  "Butte",
                  "Jefferson"
              ],
              "Lewiston": [
                  "Nez Perce"
              ],
              "Moscow": [
                  "Latah"
              ],
              "Mountain Home": [
                  "Elmore"
              ],
              "Pocatello": [
                  "Bannock"
              ],
              "Rexburg": [
                  "Fremont",
                  "Madison"
              ],
              "Sandpoint": [
                  "Bonner"
              ],
              "Twin Falls": [
                  "Jerome",
                  "Twin Falls"
              ]
          },
      IL: "Illinois",
      IN: "Indiana",
      KS: "Kansas",
      KY: "Kentucky",
      LA: "Louisiana",
      MA: "Massachusetts",
      MD: "Maryland",
      ME: "Maine",
      MI: "Michigan",
      MN: "Minnesota",
      MO: "Missouri",
      MS: "Mississippi",
      MT: "Montana",
      NC: "North Carolina",
      ND: "North Dakota",
      NE: "Nebraska",
      NH: "New Hampshire",
      NJ: "New Jersey",
      NM: "New Mexico",
      NV: "Nevada",
      NY: "New York",
      OH: "Ohio",
      OK: "Oklahoma",
      OR: "Oregon",
      PA: "Pennsylvania",
      PR: "Puerto Rico",
      RI: "Rhode Island",
      SC: "South Carolina",
      SD: "South Dakota",
      TN: "Tennessee",
      TX: "Texas",
      UT: "Utah",
      VA: "Virginia",
      VI: "Virgin Islands",
      VT: "Vermont",
      WA: "Washington",
      WI: "Wisconsin",
      WV: "West Virginia",
      WY: "Wyoming"
  }.freeze

  METRO_AREAS_BY_STATE = {
      ID: [
          "Blackfoot",
          "Boise City",
          "Burley",
          "Coeur d'Alene",
          "Hailey",
          "Idaho Falls",
          "Lewiston",
          "Moscow",
          "Mountain Home",
          "Pocatello",
          "Rexburg",
          "Sandpoint",
          "Twin Falls"
      ]
  }.freeze

  # COUNTY_BY_METRO_AREA = {
  #     "Blackfoot": [
  #         "Bingham"
  #     ],
  #     "Boise City": [
  #         "Ada",
  #         "Boise",
  #         "Canyon",
  #         "Gem",
  #         "Owyhee"
  #     ],
  #     "Burley": [
  #         "Cassia",
  #         "Minidoka"
  #     ],
  #     "Coeur d'Alene": [
  #         "Kootenai"
  #     ],
  #     "Hailey": [
  #         "Blaine",
  #         "Camas",
  #         "Lincoln"
  #     ],
  #     "Idaho Falls": [
  #         "Bonneville",
  #         "Butte",
  #         "Jefferson"
  #     ],
  #     "Lewiston": [
  #         "Nez Perce"
  #     ],
  #     "Moscow": [
  #         "Latah"
  #     ],
  #     "Mountain Home": [
  #         "Elmore"
  #     ],
  #     "Pocatello": [
  #         "Bannock"
  #     ],
  #     "Rexburg": [
  #         "Fremont",
  #         "Madison"
  #     ],
  #     "Sandpoint": [
  #         "Bonner"
  #     ],
  #     "Twin Falls": [
  #         "Jerome",
  #         "Twin Falls"
  #     ]
  # }.freeze

  def self.get_metro_by_county_and_state(county, state)
    metro_areas = STATES[state]
    metro_areas.detect {|key, value| value.include?(county)}&.first
  end

  def self.get_metros_by_state(state)
    STATES[state].keys
  end
end