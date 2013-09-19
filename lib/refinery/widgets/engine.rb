module Refinery
  module Widgets
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Widgets

      engine_name :refinery_widgets

      initializer "register refinerycms_templates plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "templates"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.widgets_admin_templates_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/widgets/template',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/widgets/templates(/.*)?$}
        end

        Refinery::Core.configure do |config| #   # Register extra javascript for backend
          config.register_javascript 'refinery/widgets.js.coffee'
          config.register_javascript 'refinery/engage.itoggle-min.js'
          config.register_stylesheet "refinery/widgets", :media => 'screen'
          config.register_stylesheet "refinery/engage.itoggle", :media => 'screen'
        end

        Refinery::AdminController.helper(Refinery::Widgets::Admin::WidgetsHelper)
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Widgets)
      end

      config.to_prepare do
        Dir["#{File.dirname(__FILE__)}/../../../app/decorators/**/*.rb"].each { |f| load(f) }
      end
    end
  end
end
