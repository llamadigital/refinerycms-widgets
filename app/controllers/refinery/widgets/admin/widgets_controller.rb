module Refinery
  module Widgets
    module Admin
      class WidgetsController < ::Refinery::AdminController

        crudify :'refinery/widgets/widget',
                :title_attribute => 'name',
                :xhr_paging => true

        def template
          @widgets = Refinery::Widgets::Widget.on_template.reusable
          render :action => :new
        end
        
        def page
          @widgets = Refinery::Widgets::Widget.on_page.reusable.has_name
          render :action => :new
        end

        protected

          def restrict_controller
            super unless %w{ template page }.include? action_name
          end


      end
    end
  end
end
