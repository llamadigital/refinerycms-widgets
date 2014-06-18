module Refinery
  module Widgets
    module Admin
      class TemplatesController < ::Refinery::AdminController

        def list
          @templates = Template.order(:position)
          @parent_id = params[:parent_id]
        end

        crudify :'refinery/widgets/template',
                :title_attribute => 'name',
                :xhr_paging => true

        before_filter :check_for_pages!, :only => :destroy

        def check_for_pages!
          if Refinery::Widgets::Template.find(params[:id]).pages.any?
            redirect_to refinery.widgets_admin_templates_path, 
              :notice => 'Please delete any pages using this template before destroying it.'
            return
          end
        end

        private
        def template_params
          params.require(:template).permit!
        end

      end
    end
  end
end
