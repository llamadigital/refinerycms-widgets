Refinery::PagesController.class_eval do 
  def find_page(fallback_to_404 = true)
    @page ||= case action_name
              when "home"
                Refinery::Page.where(:link_url => '/').first
              when "show"
                Refinery::Page.find_by_path_or_id(params[:path], params[:id])
              end
    if @page
      call_widget_helpers(@page)
      @page
    else
      call_widget_helpers(::Refinery::Page.where(:menu_match => "^/404$").first)
      error_404 if fallback_to_404
    end
  end
end

