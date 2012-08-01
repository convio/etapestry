module ETapestry
  class AccountSearchView < BaseView
    keyword(:search_for)              {content.text_field(:id, 'searchString')}
    private_keyword(:select)          {|name| content.link(:text, /^#{name}/)}
    navigation_keyword(:find_button)  {content.button(:value, 'Find')}

    class << self
      def home(model=nil)
        navbar.link(:text, 'Find Account').click
      end
      alias :create :home
      alias :search :home
    end
  end
end
