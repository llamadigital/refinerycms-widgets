Refinery::Page.class_eval do
  attr_accessible :template_id
  
  belongs_to :template, class_name: 'Refinery::Widgets::Template'
  
  before_validation :validate_widgets

  def widgets
    parts.collect(&:widgets).flatten
  end

  private
    
    def validate_widgets
      widgets.each do |widget|
        widget.valid?
      end
    end

end
