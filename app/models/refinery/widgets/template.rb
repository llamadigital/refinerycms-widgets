module Refinery
  module Widgets
    class Template < Refinery::Core::BaseModel

      has_many :template_parts, :dependent => :destroy, :class_name => 'Refinery::Widgets::TemplatePart'
      accepts_nested_attributes_for :template_parts, :allow_destroy => true

      has_many :pages, :class_name => 'Refinery::Page'

      attr_accessible :name, :position, :template_parts_attributes

      validates :name, :presence => true, :uniqueness => true
      before_validation :validate_widgets

      after_save :synchronize_template_parts

      PartNames = Refinery::Pages.config[:default_parts]
      Parts = PartNames.map(&:underscore) 

      def self.part_names
        PartNames
      end

      def self.parts
        Parts
      end

      def synchronize_template_parts
        pages.each do |p|
          template_parts.each do |tp|
            tp.sychronize_widgets!(p)
          end
        end
      end

      def unlocked_template_parts
        template_parts.reject(&:locked?)
      end

      def template_part(name)
        if template_parts.find{|tp| tp.name == name }
          template_parts.find{|tp| tp.name == name }
        elsif template_parts.where(name: name).any?
          template_parts.where(name: name).first
        else
          self.template_parts.build(name: name, locked: '0')
        end
      end

      def widgets
        template_parts.collect(&:widgets).flatten
      end

      private
        
        def validate_widgets
          widgets.each do |widget|
            widget.valid?
          end
        end

    end
  end
end
