module Refinery
  module Widgets
    include ActiveSupport::Configurable

    config_accessor :base_widgets, :excluded_widgets, 
      :additional_widgets, :super_admin_widgets

    self.base_widgets = [{name: 'Refinery::Widgets::ContentBlockWidget', description: 'Text block which can include images and simple styles'}]
    self.excluded_widgets = []
    self.additional_widgets = []
    self.super_admin_widgets = []
    
  end
end

