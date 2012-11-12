module ETapestry
  module Account
    class OtherView < BaseView
      keyword(:name) { content.text_field(:name, 'name') }
      keyword(:sort_name) { content.text_field(:name, 'sortKey') }
      keyword(:recognition_name) { content.text_field(:name, 'recognitionName') }
      keyword(:recognition_type) { content.select_list(:name, 'recognitionType') }

      navigation_keyword(:other_link) { content.link(:text, 'Other') }
      navigation_keyword(:save_button) { content.button(:value, 'Save And') }

      def home(model=nil)
        other_link.click
      end

      alias :edit :home
    end
  end
end
