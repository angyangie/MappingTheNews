require 'pry'
require 'rest-client'

class CountryCreator

  def create_countries

    keywords = ["Afghanistan", "Angola", "Albania", "United Arab Emirates", "Argentina", "Armenia", "Antarctica", "French Southern and Antarctic Lands", "Australia", "Austria", "Azerbaijan", "Burundi", "Belgium", "Benin", "Burkina Faso", "Bangladesh", "Bulgaria", "The Bahamas", "Bosnia and Herzegovina", "Belarus", "Belize", "Bermuda", "Bolivia", "Brazil", "Brunei", "Bhutan", "Botswana", "Central African Republic", "Canada", "Switzerland", "Chile", "China", "Ivory Coast", "Cameroon", "Democratic Republic of the Congo", "Republic of the Congo", "Colombia", "Costa Rica", "Cuba", "Northern Cyprus", "Cyprus", "Czech Republic", "Germany", "Djibouti", "Denmark", "Dominican Republic", "Algeria", "Ecuador", "Egypt", "Eritrea", "Spain", "Estonia", "Ethiopia", "Finland", "Fiji", "Falkland Islands", "France", "Gabon", "United Kingdom", "Georgia","Ghana", "Guinea", "Gambia", "Guinea Bissau", "Equatorial Guinea", "Greece", "Greenland", "Guatemala", "French Guiana", "Guyana", "Honduras", "Croatia", "Haiti", "Hungary", "Indonesia", "India", "Ireland", "Iran", "Iraq", "Iceland", "Israel", "Italy", "Jamaica", "Jordan", "Japan", "Kazakhstan", "Kenya", "Kyrgyzstan", "Cambodia", "South Korea", "Kosovo", "Kuwait", "Laos", "Lebanon", "Liberia", "Libya", "Sri Lanka", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Morocco", "Moldova", "Madagascar", "Mexico", "Macedonia", "Mali", "Malta", "Myanmar", "Montenegro", "Mongolia", "Mozambique", "Mauritania", "Malawi", "Malaysia", "Namibia", "New Caledonia", "Niger", "Nigeria", "Nicaragua", "Netherlands", "Norway", "Nepal", "New Zealand", "Oman", "Pakistan", "Panama", "Peru", "Philippines", "Papua New Guinea", "Poland", "Puerto Rico", "North Korea", "Portugal", "Paraguay", "Qatar", "Romania", "Russia", "Rwanda", "Western Sahara", "Saudi Arabia", "Sudan", "South Sudan", "Senegal", "Solomon Islands", "Sierra Leone", "El Salvador", "Somaliland", "Somalia", "Republic of Serbia", "Suriname", "geometry", "Slovakia", "Slovenia", "Sweden", "Swaziland", "Syria", "Chad", "Togo", "Thailand", "Tajikistan", "Turkmenistan", "East Timor", "Trinidad and Tobago", "Tunisia", "Turkey", "Taiwan", "United Republic of Tanzania", "Uganda", "Ukraine", "Uruguay", "United States of America", "Uzbekistan", "Venezuela", "Vietnam", "Vanuatu", "West Bank", "Yemen", "South Africa", "Zambia", "Zimbabwe"]

    keywords.each do |keyword|
      Country.find_or_create_by(name: keyword)
    end

  end

end
