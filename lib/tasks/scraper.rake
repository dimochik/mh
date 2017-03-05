namespace :scrape do
  desc 'Meh....'
  task :load_homes => :environment do
    states = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new-hampshire", "new-jersey", "new-mexico", "new-york", "north-carolina", "north-dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode-island", "south-carolina", "south-dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west-virginia", "wisconsin", "wyoming"]
    states.each do |state|

      links = []

      (1..1000).each do |page|
        site_url = "http://www.mhbay.com/mobile-home-park-directory/#{state}/all/page/#{page}"
        puts "page: #{page}"
        page = Nokogiri::HTML(open(site_url))
        page_links = page.css('div.entry a').map { |link| link['href'] }.select { |l| l=~ /http:/ }
        break if page_links.empty?
        links += page_links
      end

      links.each do |link|
        page = Nokogiri::HTML(open(link))
        name = page.css('#md_name').text rescue ""
        address_street = page.css("#md_location [@itemprop='streetAddress']").text rescue nil
        address_city = page.css("#md_location [@itemprop='addressLocality']").text rescue nil
        address_state = page.css("#md_location [@itemprop='addressRegion']").text rescue nil
        address_zip = page.css("#md_location [@itemprop='postalCode']").first.text rescue nil
        number_of_lots = page.css(".prop_desc").text.split.join(" ").match(/Number of Lots: (\d+)/)[1] rescue nil
        property_id = link.match(/\/(\d+)-/)[1] rescue nil

        description = page.css("#md_description").text rescue nil
        water = page.css(".prop_desc").text.split.join(" ").match(/Water:(\w+)/)[1] rescue nil
        sewer = page.css(".prop_desc").text.split.join(" ").match(/Sewer:(\w+)/)[1] rescue nil
        occupancy_percent = page.css(".prop_desc").text.split.join(" ").match(/Total Occupancy:(\w+)/)[1] rescue nil
        lot_rent = page.css(".prop_desc").text.split.join(" ").match(/Average MH Lot Rent: \$(\d+)/)[1] rescue nil
        poh = page.css(".prop_desc").text.split.join(" ").match(/Number of Park-owned Homes:(\d+)/)[1] rescue nil
        puts name

        #create a park
        MobileHome.create(
          {
            park_name: name,
            mhbay_url: link,
            mhbay_id: property_id,
            number_of_lots: number_of_lots,
            description: description,
            water: water,
            sewer: sewer,
            occupancy_percent: occupancy_percent,
            lot_rent: lot_rent,
            poh: poh,
            address_attributes: {
              full_address: [address_street, address_city, address_state, address_zip].join(", ")
            }
          }
        )
      end
    end
  end

  desc 'Meh....'
  task :update_with_owner_info => :environment do
    MobileHome.all.each do |mh|
      q_address = mh.address.full_address
      api_url = "https://reportallusa.com/api/parcels.php?client=2etYlLyrUZ&v=2&q=#{q_address}"
      response = HTTParty.get(api_url)
      data = response.parsed_response
      next unless data["status"] == "OK"
      results = data["results"].first
      next unless results
      binding.pry

      #1. create owner
      owner = Owner.create(
          {
              name: results["owner"],
              mail_name: results["mail_name"],
              address_attributes: {
                  full_address: [results["mail_address1"],results["mail_address2"],results["mail_address3"]].compact.join(", ")
              }
          }
      )
      #update mobile_home
      mh.update_attributes(
        {
            owner_id: owner.id,
            county_id: results["county_id"],
            rausa_id: results["rausa_id"],
            parcel_id: results["parcel_id"],
            trans_date: results["trans_date"],
            sale_price: results["sale_price"],
            mkt_val_land: results["mkt_val_land"],
            mkt_val_bldg: results["mkt_val_bldg"],
            mkt_val_tot: results["mkt_val_tot"],
            bldg_sqft: results["bldg_sqft"],
            ngh_code: results["ngh_code"],
            land_use_code: results["land_use_code"],
            land_use_class: results["land_use_class"],
            story_height: results["story_height"],
            muni_id: results["muni_id"],
            school_dist_id: results["school_dist_id"],
            acreage_deeded: results["acreage_deeded"],
            acreage_calc: results["acreage_calc"],
            geom_as_wkt: results["geom_as_wkt"],
            address_attributes: {
                number: results["addr_number"],
                street: [results["addr_street_prefix"],results["addr_street_name"],results["addr_street_suffix"]].compact.join(", "),
                city: results["muni_name"],
                state: results["state_abbr"],
                county: results["county_name"],
                zip: results["physzip"]
            }
        }
      )

    end
  end
end