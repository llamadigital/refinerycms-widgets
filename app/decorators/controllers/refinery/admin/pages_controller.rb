module WidgetsPagesController
  private
  def page_params
    params.require(:page).permit!
  end
end

Refinery::Admin::PagesController.class_eval do 
  before_filter :load_valid_templates, :only => [:edit, :new, :update, :create]

  def render(*args)
    if params[:action] == 'new'
      if params[:template_id]
        @template = Refinery::Widgets::Template.find(params[:template_id])
        @page.parts = []
        @template.template_parts.each_with_index do |template_part, index|
          page_part = Refinery::PagePart.new(:title => template_part.name, :position => index, :locked => template_part.locked)
          template_part.widgets.each do |widget|
            w = widget.dup_by_ref
            w.locked = true
            w.layout = true
            page_part.widgets << w
          end
          @page.parts << page_part
        end
      end
    end
    super
  end

  prepend WidgetsPagesController

end
