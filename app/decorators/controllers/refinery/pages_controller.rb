Refinery::PagesController.class_eval do 
  def find_page(fallback_to_404 = true)
    @page ||= case action_name
              when "home"
                Refinery::Page.where(:link_url => '/').first
              when "show"
                Refinery::Page.find_by_path_or_id(params[:path], params[:id])
              end
    @page || (error_404 if fallback_to_404)
    call_widget_helpers(@page)
  end
end

