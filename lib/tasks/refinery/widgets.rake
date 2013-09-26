namespace :refinery do

  namespace :widgets do

    # call this task by running: rake refinery:templates:my_task
    desc "Reset page parts on pages and templates after changing config"
    task :reset_parts => :environment do
      Refinery::Widgets::Template.all.each do |t|
        t.template_parts = []
        Refinery::Widgets::Template::PartNames.each do |part|
          t.template_parts << Refinery::Widgets::TemplatePart.new(name: part)
        end
        t.save!
      end
      Refinery::Page.all.each do |p|
        p.parts = []
        Refinery::Widgets::Template::PartNames.each do |part|
          p.parts << Refinery::PagePart.new(title: part)
        end
        p.save!
      end
    end

  end

end
