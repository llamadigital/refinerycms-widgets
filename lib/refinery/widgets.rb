require 'refinerycms-core'

module Refinery
  autoload :WidgetsGenerator, 'generators/refinery/widgets_generator'

  module Widgets
    require 'refinery/widgets/engine'
    require 'refinery/widgets/configuration'
    require 'refinery/widgets/widget_type'
    require 'refinery/widgets/acts_as_widget'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
