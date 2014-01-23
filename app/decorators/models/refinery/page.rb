Refinery::Page.class_eval do
  attr_accessible :template_id
  
  belongs_to :template, class_name: 'Refinery::Widgets::Template'
  
  before_validation :validate_widgets

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
    (::Refinery::Pages.default_parts.collect{|dp| parts.find{|p| p.title == dp } } + parts).uniq
  end

  private
    
    def validate_widgets
      widgets.each do |widget|
        widget.valid?
      end
    end

end
