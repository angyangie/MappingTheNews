$(document).ready(function() {
  apiQuery()
})

function apiQuery(keyword) {
  // var interactor = GithubInteractor("some token")
  
  var AlchemyUrl = "https://gateway-a.watsonplatform.net/calls/data/GetNews?outputMode=json&start=now-1d&end=now&count=5&q.enriched.url.enrichedTitle.keywords.keyword.text=" + keyword + "&return=enriched.url.url,enriched.url.title&apikey=0b24c5b6cbc2f4c69cb2aaa5c47a859a57b7ba2d"

  $.ajax({
    type: "GET",
    
    url: AlchemyUrl,
    dataType: "json"
  }).done(handleResponse)
}

function handleResponse(returnData) {

  var article_titles = []
  returnData.result.docs.forEach(function(article) {
    article_titles.push(article.source.enriched.url.title)
  })

  $("#query-result").append(article_titles)
}

function handleError(error){
  console.log("Post error: " + error)
}
