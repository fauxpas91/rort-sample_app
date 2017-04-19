module ApplicationHelper
    
    #Return a full title for each page even if one isn't provided by the view
    def full_title(page_title = "")
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
end
