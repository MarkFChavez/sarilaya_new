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

	def markdown(content)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
                autolink: true,
                no_intra_emphasis: true,
                fenced_code_blocks: true,
                lax_html_blocks: true,
                strikethrough: true,
                superscript: true
        }
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end

end
