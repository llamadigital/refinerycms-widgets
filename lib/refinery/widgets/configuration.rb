module Refinery
  module Widgets
    include ActiveSupport::Configurable

    config_accessor :base_widgets, :excluded_widgets, 
      :additional_widgets, :super_admin_widgets

    self.base_widgets = ['Refinery::Widgets::ContentBlockWidget']
    self.excluded_widgets = []
    self.additional_widgets = []
    self.super_admin_widgets = []
    
  end
end

