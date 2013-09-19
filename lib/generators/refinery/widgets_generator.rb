module Refinery
  class WidgetsGenerator < Rails::Generators::Base
    
    source_root File.expand_path('../templates', __FILE__)

    def rake_db
      rake "refinery_widgets:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Widgets extension
Refinery::Widgets::Engine.load_seed
        EOH
      end
    end

    def generate_widgets_initializer
      template "config/initializers/refinery/widgets.rb.erb",
        File.join(destination_root, "config", "initializers", "refinery", "widgets.rb")
    end

  end
end
