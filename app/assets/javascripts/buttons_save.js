$(document).ready(function() {

$('.add_to_favorites_articles').on("click", function(e){

    e.stopPropagation();
    e.preventDefault();
     
      var article_title = $(this.parentElement).clone().children().remove().end().text().trim()

      var article_link = $(this).parent().find('a').attr('href')

      var data = {}
      data[article_title] = article_link

      $.ajax({
        type: "POST",
        url: "/favorite_articles",
        dataType: "JSON",
        data: data
        })

  })

// $('.add_to_favorites_countries').on("click", function(e){
//     e.stopPropagation();
//     e.preventDefault();


//       var article_title = $(this.parentElement).clone().children().remove().end().text().trim()

//       var article_link = $(this).parent().find('a').attr('href')

//       // var data = { title: article_title, link: article_link }
//       var data = {}
//       data[article_title] = article_link

//       $.ajax({
//         type: "POST",
//         url: "/favorite_articles",
//         dataType: "JSON",
//         data: data
//         })
//   })

//////


  // $('.save_for_later_countries').on("click", function(e){

  //   e.stopPropagation();
  //   e.preventDefault();

  //     var article_title = $(this.parentElement).clone().children().remove().end().text().trim()

  //     var article_link = $(this).parent().find('a').attr('href')

  //   ('#later_articles').append("<li><a href='" + article_url + "'>" + article_title + "</a></li>")
  // })

  // $('.save_for_later_articles').on("click", function(e){

  // e.stopPropagation();
  //   e.preventDefault();
     
  //     var article_title = $(this.parentElement).clone().children().remove().end().text().trim()

  //     var article_link = $(this).parent().find('a').attr('href')


  //   ('#later_articles').append("<li><a href='" + article_url + "'>" + article_title + "</a></li>")
  // })

  // $('.add_country_to_favorites').on("click", function(e){

  //   var country_name = $(this.parentElement).clone().children().remove().first().text().trim()

  //   var country_link = $(this).parent().find('a').attr('href')

  //   ('#favorite_countries').append("<li><a href='" + country_url + "'>" + country_name + "</a></li>")
  // })

})
