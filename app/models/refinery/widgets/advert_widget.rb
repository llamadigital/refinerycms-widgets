module Refinery
  module Widgets
    class AdvertWidget < ActiveRecord::Base

      acts_as_widget

      belongs_to :image, class_name: '::Refinery::Image'

    end
  end
end
