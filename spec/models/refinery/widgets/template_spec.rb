require 'spec_helper'

module Refinery
  module Widgets
    describe Template do
      describe "validations" do
        subject do
          FactoryGirl.create(:template,
          :name => 'Refinery CMS')
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == 'Refinery CMS' }
      end

      describe "#template_parts_attributes=" do
        let(:valid_template_part_attributes) {
          {1 => {:name => 'foo'}}
        }
        it "adds new template parts" do
          template = Template.new
          template.template_parts_attributes = valid_template_part_attributes
          expect(template.template_parts).to_not be_nil
        end
      end

    end
  end
end
