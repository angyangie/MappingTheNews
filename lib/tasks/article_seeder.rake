require 'pry'
require 'rest-client'

class ArticleSeeder

def get_articles

  #  

  keywords = ["Afghanistan", "Angola", "Albania", "United Arab Emirates", "Argentina", "Armenia", "Antarctica", "French Southern and Antarctic Lands", "Australia", "Austria", "Azerbaijan", "Burundi", "Belgium", "Benin", "Burkina Faso", "Bangladesh", "Bulgaria", "The Bahamas", "Bosnia and Herzegovina", "Belarus", "Belize", "Bermuda", "Bolivia", "Brazil", "Brunei", "Bhutan", "Botswana", "Central African Republic", "Canada", "Switzerland", "Chile", "China", "Ivory Coast", "Cameroon", "Democratic Republic of the Congo", "Republic of the Congo", "Colombia", "Costa Rica", "Cuba", "Northern Cyprus", "Cyprus", "Czech Republic", "Germany", "Djibouti", "Denmark", "Dominican Republic", "Algeria", "Ecuador", "Egypt", "Eritrea", "Spain", "Estonia", "Ethiopia", "Finland", "Fiji", "Falkland Islands", "France", "Gabon", "United Kingdom", "Georgia","Ghana", "Guinea", "Gambia", "Guinea Bissau", "Equatorial Guinea", "Greece", "Greenland", "Guatemala", "French Guiana", "Guyana", "Honduras", "Croatia", "Haiti", "Hungary", "Indonesia", "India", "Ireland", "Iran", "Iraq", "Iceland", "Israel", "Italy", "Jamaica", "Jordan", "Japan", "Kazakhstan", "Kenya", "Kyrgyzstan", "Cambodia"]

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

