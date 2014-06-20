module Refinery
  module Widgets
    class ContentBlockWidget < ActiveRecord::Base

      acts_as_widget

      validates :content, :presence => true

    end
  end
end
