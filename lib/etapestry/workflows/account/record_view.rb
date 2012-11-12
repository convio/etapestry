module ETapestry
  module Account
    class RecordView < BaseView
      keyword(:constituent_role) {content.checkbox(:id, 'createCustomerRole')}
      keyword(:tribute_role)     {content.checkbox(:id, 'createTributeRole')}
      keyword(:user_role)        {content.checkbox(:id, 'createUserRole')}

      navigation_keyword(:save_button)      {content.button(:value, 'Save And')}

      def home(model=nil)
        navbar.link(:text, 'Add Account').click
      end
      alias :create :home
    end
  end
end
