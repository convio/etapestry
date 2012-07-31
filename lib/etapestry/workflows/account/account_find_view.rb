module ETapestry
  class AccountFindView < BaseView
    keyword(:search_for)       {content.text_field(:id, 'searchString')}
    keyword(:find_button)      {content.button(:value, 'Find')}

    class << self
      def home(model=nil)
        navbar.link(:text, 'Find Account').click
      end
      alias :create :home
      alias :search :home

      def select(model)
        content.link(:text, /^#{model.search_for}/).click
      end
    end
  end
end
