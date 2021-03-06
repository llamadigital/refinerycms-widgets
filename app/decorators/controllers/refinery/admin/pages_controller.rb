Refinery::Admin::PagesController.class_eval do 

  def render(*args)
    if params[:action] == 'new'
      if params[:template_id]
        @template = Refinery::Widgets::Template.find(params[:template_id])
        @page.template = @template
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

  private
  def page_params_with_permit_all 
    params.require(:page).permit!
  end

  alias_method_chain :page_params, :permit_all

end
