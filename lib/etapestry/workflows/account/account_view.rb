module ETapestry
  class AccountView < BaseView
    keyword(:constituent_role) {content.checkbox(:id, 'createCustomerRole')}
    keyword(:tribute_role)     {content.checkbox(:id, 'createTributeRole')}
    keyword(:user_role)        {content.checkbox(:id, 'createUserRole')}
    keyword(:name)             do
      content.text_field(:id, 'name_0')
    end
    keyword(:sort_name)        {content.text_field(:id, 'sortKey_0')}
    keyword(:recognition_name) {content.text_field(:id, 'recognitionName_0')}
    keyword(:recognition_type) {content.select_list(:id, 'recognitionType_0')}

    keyword(:persona_type)     {content.select_list(:id, 'personaType_0')}
    keyword(:start_date)       {content.text_field(:id, 'startDate_0')}
    keyword(:end_date)         {content.text_field(:id, 'endDate_0')}
    keyword(:address)          {content.text_field(:id, 'address_0')}

    keyword(:city)             {content.text_field(:id, 'city_0')}
    keyword(:state)            {content.text_field(:id, 'state_0')}
    keyword(:postal_code)      {content.text_field(:id, 'postalCode_0')}
    keyword(:county)           {content.text_field(:id, 'county_0')}
    keyword(:country)          {content.select_list(:id, 'countrySelect_0')}
    keyword(:voice)            {content.td(:text, 'Voice').nextsibling.text_field}
    keyword(:fax)              {content.td(:text, 'Fax').nextsibling.text_field}
    keyword(:mobile)           {content.td(:text, 'Mobile').nextsibling.text_field}
    keyword(:email)            {content.text_field(:id, 'emailAddress_0')}
    keyword(:web_page)         {content.text_field(:id, 'webAddress_0')}
    keyword(:note)             {content.text_field(:id, 'note_0')}
    keyword(:short_salutation) {content.text_field(:id, 'shortDesignation_0')}
    keyword(:long_salutation)  {content.text_field(:id, 'longDesignation_0')}

    keyword(:role)             {content.tr(:class, "entityTitle").tds.last}
    keyword(:personas)         {content.link(:text, 'Personas')}
    keyword(:save_button)      {content.button(:value, 'Save And')}

    class << self
      def home(model=nil)
        navbar.link(:text, 'Add Account').click
      end
      alias :create :home

      def edit(model)
        AccountFind.new(AccountFindModel.new(:search_for => model.name)).search
        personas.click
      end
    end
  end
end
