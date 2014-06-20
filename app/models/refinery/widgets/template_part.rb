module Refinery
  module Widgets
    class TemplatePart < Refinery::Core::BaseModel

      belongs_to :template
      has_many :widgets, -> { order(:position) },
        class_name: 'Refinery::Widgets::Widget', as: :container
        
      accepts_nested_attributes_for :widgets, :allow_destroy => true

      validates :name, :presence => true, :uniqueness => {:scope => 'template_id'}

      def sychronize_widgets!(page)
        page_part = page.parts.select{|pp| pp.title == self.name }.first
        if page_part
          page_part_ids = page_part.widgets.select{|w| w.widget_id? && w.layout? }.collect{|x| x.widget_id }
          template_part_ids = self.widgets.collect{|x| x.id } 
          missing = template_part_ids - page_part_ids
          missing.each do |w_id|
            page_part.add_ref_widget_for! Widget.find(w_id)
          end
          extras = page_part_ids - template_part_ids
          extras.each do |w_id|
            page_part.widgets.find{|x| x.widget_id == w_id }.destroy
          end
          if page_part.locked?
            unless page_part_ids == template_part_ids
              self.widgets.sort_by(&:position).each do |widget|
                page_part.widgets.find{|w| w.widget_id == widget.id }.update_attribute(:position, widget.position)
              end
            end
          end
          if page_part.locked != self.locked
            page_part.locked = self.locked
            page_part.save!
          end
        end
      end

    end
  end
end
