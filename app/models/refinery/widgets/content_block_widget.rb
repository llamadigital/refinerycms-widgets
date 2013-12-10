module Refinery
  module Widgets
    class ContentBlockWidget < ActiveRecord::Base

      acts_as_widget

      attr_accessible :content, :widget_id

      validates :content, :presence => true

    end
  end
end
