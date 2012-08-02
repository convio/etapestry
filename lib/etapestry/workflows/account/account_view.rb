module ETapestry
  class AccountView < BaseView
    keyword(:constituent_role) {content.checkbox(:id, 'createCustomerRole')}
    keyword(:tribute_role)     {content.checkbox(:id, 'createTributeRole')}
    keyword(:user_role)        {content.checkbox(:id, 'createUserRole')}
    keyword(:name)             {content.text_field(:id, 'name_0')}
    keyword(:sort_name)        {content.text_field(:id, 'sortKey_0')}
    keyword(:recognition_name) {content.text_field(:id, 'recognitionName_0')}
    keyword(:recognition_type) {content.select_list(:id, 'recognitionType_0')}

    navigation_keyword(:save_button)      {content.button(:value, 'Save And')}

    class << self
      def home(model=nil)
        navbar.link(:text, 'Add Account').click
      end
      alias :create :home
    end
  end
end
