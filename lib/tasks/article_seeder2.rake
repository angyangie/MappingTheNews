require 'pry'
require 'rest-client'

class ArticleSeeder2

def get_articles

  #  

  keywords = ["South Korea", "Kosovo", "Kuwait", "Laos", "Lebanon", "Liberia", "Libya", "Sri Lanka", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Morocco", "Moldova", "Madagascar", "Mexico", "Macedonia", "Mali", "Malta", "Myanmar", "Montenegro", "Mongolia", "Mozambique", "Mauritania", "Malawi", "Malaysia", "Namibia", "New Caledonia", "Niger", "Nigeria", "Nicaragua", "Netherlands", "Norway", "Nepal", "New Zealand", "Oman", "Pakistan", "Panama", "Peru", "Philippines", "Papua New Guinea", "Poland", "Puerto Rico", "North Korea", "Portugal", "Paraguay", "Qatar", "Romania", "Russia", "Rwanda", "Western Sahara", "Saudi Arabia", "Sudan", "South Sudan", "Senegal", "Solomon Islands", "Sierra Leone", "El Salvador", "Somaliland", "Somalia", "Republic of Serbia", "Suriname", "geometry", "Slovakia", "Slovenia", "Sweden", "Swaziland", "Syria", "Chad", "Togo", "Thailand", "Tajikistan", "Turkmenistan", "East Timor", "Trinidad and Tobago", "Tunisia", "Turkey", "Taiwan", "United Republic of Tanzania", "Uganda", "Ukraine", "Uruguay", "United States of America", "Uzbekistan", "Venezuela", "Vietnam", "Vanuatu", "West Bank", "Yemen", "South Africa", "Zambia", "Zimbabwe"]

  keywords.each do |keyword|

    modified_keyword = keyword.gsub(/\s/,'+')


    alchemyUrl = "https://gateway-a.watsonplatform.net/calls/data/GetNews?outputMode=json&start=now-1d&end=now&count=10&q.enriched.url.enrichedTitle.keywords.keyword.text=" + modified_keyword + "&return=enriched.url.url,enriched.url.title&apikey=0b24c5b6cbc2f4c69cb2aaa5c47a859a57b7ba2d"
    
    articles_for_one_country = RestClient.get(alchemyUrl)


    save_articles(articles_for_one_country, keyword)

  end

end

def save_articles(articles_json, keyword)
  articles_hash = eval(articles_json)

  if articles_hash[:result][:docs]
    articles_hash[:result][:docs].each do |article|
      Article.find_or_create_by(title: article[:source][:enriched][:url][:title], url: article[:source][:enriched][:url][:url], country_name: keyword)
    end
  end
end

end

