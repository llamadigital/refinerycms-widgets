Refinery::Page.class_eval do
  
  belongs_to :template, class_name: 'Refinery::Widgets::Template'
  
  before_validation :validate_widgets

  before_save :change_template

  def self.find_by_widget_class(widget_class)
    instance = widget_class.first
    return nil if instance.nil?
    container = widget_class.first.widget.container
    return nil unless container.class == Refinery::PagePart
    container.page
  end

  def widgets
    parts.collect(&:widgets).flatten
  end

  def ordered_parts
    (::Refinery::Pages.default_parts.collect{|dp| parts.find{|p| p.title == dp } } + parts)
    .uniq.compact
  end

  def self.find_or_create_by_link_url!(link_url, options={})
    page = self.find_by_link_url(link_url)
    if page
      return page
    else
      page = self.new(
        title: link_url.gsub(/\W/, ' ').strip.capitalize,
        link_url: link_url,
        deletable: false,
        menu_match: "^#{link_url}(\/|\/.+?|)$",
        show_in_menu: false
      )
      if options[:parent].present?
        parent = self.find_by_link_url(options[:parent])
        if parent.nil?
          parent = self.find_or_create_by_link_url(options[:parent])
        end
        page.parent_id = parent.id
      end
      page.save!
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|           
        page.parts.create(:title => default_page_part, :body => nil, :position => index)    
      end
      page.template_id = ::Refinery::Widgets::Template.first.id
      page.save!
      page
    end
  end

  private
    
    def validate_widgets
      widgets.each do |widget|
        widget.valid?
      end
    end

    def change_template
      if changes.has_key?(:template_id) && !self.new_record?
        widgets.each{|w| w.destroy if w.layout == true}
        template.template_parts.each do |tp|
          tp.sychronize_widgets!(self)
        end
      end
    end

end
