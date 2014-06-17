Refinery::PagePart.class_eval do 
  has_many :widgets, -> { order(:position) },
    class_name: 'Refinery::Widgets::Widget', as: :container
  accepts_nested_attributes_for :widgets, :allow_destroy => true

  def add_ref_widget_for!(widget)
    w = widget.dup_by_ref
    w.locked = true
    w.layout = true
    self.widgets << w
    self.save!
  end

end
