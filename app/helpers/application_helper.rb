module ApplicationHelper

  # Return the custom title
  def full_tittle(page_tittle = "")
    base_tittle = "Ruby on Rails Sample App"
    if page_tittle.empty?
      base_tittle
    else
      #   "#{page_tittle} | #{base_tittle}"
      page_tittle + " | " + base_tittle
    end
  end
end
