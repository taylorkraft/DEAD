module RatingsHelper

  def display_header(rating)
     if params[:beer_id]
      content_tag(:h1, "Rate #{@rating.beer.brewery.name} #{@rating.beer.name}")
     else
      content_tag(:h1, "Create A Rating")
    end
  end
end
