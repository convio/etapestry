module ETapestry
  module Account
    class SearchView < BaseView
      keyword(:search_for)              {content.text_field(:id, 'searchString')}
      private_keyword(:account_link)    {|name| content.link(:text, /^#{name}/)}
      navigation_keyword(:find_button)  {content.button(:value, 'Find')}

      def home(model=nil)
        navbar.link(:text, 'Find Account').click
      end
      alias :create :home
      alias :search :home
    end
  end
end
