Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-widgets').blank?
        user.plugins.create(:name => 'refinerycms-widgets',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  if Refinery::Widgets::Template.all.empty?
    template = Refinery::Widgets::Template.new(name: 'Standard')
    Refinery::Widgets::Template.parts.each do |p|
      template.template_parts << Refinery::Widgets::TemplatePart.new(name: p)
    end
    template.save!
    Refinery::Page.where(template_id: nil).each do |p|
      p.update_attributes!(template_id: template.id)
    end
  end

end
