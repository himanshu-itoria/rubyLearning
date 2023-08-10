# require 'nokogiri'
# require 'open-uri'

# # URL of the FedEx tracking page
# url = 'https://www.fedex.com/fedextrack/?trknbr=782062773425&trkqual=12026~782062773425~FDEG'

# # Fetch the webpage content
# html = URI.open(url)

# # Parse the HTML content using Nokogiri
# doc = Nokogiri::HTML(html)

# # Extract schedule delivery date
# doc.css('fdx-c-heading fdx-c-heading--h5').each do |link|
#     puts link.content
# end
# # schedule_delivery_date.to_s
# # puts abc.class
# # Display the extracted schedule delivery date
# # puts "Schedule Delivery Date: #{schedule_delivery_date}"
require 'nokogiri'
require 'open-uri'

# URL of the FedEx tracking page
# url = 'https://www.fedex.com/fedextrack/?trknbr=782062773425&trkqual=12026~782062773425~FDEG'

# # Fetch the webpage content
# html = URI.open(url).read

# Parse the HTML content using Nokogiri
doc = Nokogiri::HTML(URI.open('https://www.fedex.com/fedextrack/?trknbr=781857705071&trkqual=12026~781857705071~FDEG'))

# Extract schedule delivery date
# schedule_delivery_date = doc.css('.deliveryDateTextBetween').text.strip
# schedule_delivery_date.empty?
# Display the extracted schedule delivery date


# puts "Schedule Delivery Date: #{schedule_delivery_date}"

doc.css('div').each do |title|
    print title.content
end