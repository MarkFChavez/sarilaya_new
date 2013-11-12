module ApplicationHelper

	def title(page_title)
		content_for :title do 
			page_title
		end
	end

	def set_active(current_page=nil, page)
		if current_page == page
			"active"
		else
			""
		end
	end

end
