module ETapestry
  class AccountView < BaseView
    keyword(:constituent_role) {form.checkbox(:id, 'createCustomerRole')}
    keyword(:tribute_role)     {form.checkbox(:id, 'createTributeRole')}
    keyword(:user_role)        {form.checkbox(:id, 'createUserRole')}
    keyword(:name)             {form.text_field(:id, 'name_0')}
    keyword(:sort_name)        {form.text_field(:id, 'sortKey_0')}
    keyword(:recognition_name) {form.text_field(:id, 'recognitionName_0')}
    keyword(:recognition_type) {form.select_list(:id, 'recognitionType_0')}

    keyword(:persona_type)     {form.select_list(:id, 'personaType_0')}
    keyword(:start_date)       {form.text_field(:id, 'startDate_0')}
    keyword(:end_date)         {form.text_field(:id, 'endDate_0')}
    keyword(:address)          {form.text_field(:id, 'address_0')}

    keyword(:city)             {form.text_field(:id, 'city_0')}
    keyword(:state)            {form.text_field(:id, 'state_0')}
    keyword(:postal_code)      {form.text_field(:id, 'postalCode_0')}
    keyword(:county)           {form.text_field(:id, 'county_0')}
    keyword(:country)          {form.select_list(:id, 'countrySelect_0')}
    keyword(:voice)            {form.td(:text, 'Voice').nextsibling}
    keyword(:fax)              {form.td(:text, 'Fax').nextsibling}
    keyword(:mobile)           {form.td(:text, 'Mobile').nextsibling}
    keyword(:email)            {form.text_field(:id, 'emailAddress_0')}
    keyword(:web_page)         {form.text_field(:id, 'webAddress_0')}
    keyword(:note)             {form.text_field(:id, 'note_0')}
    keyword(:short_salutation) {form.text_field(:id, 'shortDesignation_0')}
    keyword(:long_salutation)  {form.text_field(:id, 'longDesignation_0')}

    keyword(:save_button)      {form.button(:value, 'Save And')}

    class << self
      def home(model=nil)
        navbar.link(:text, 'Add Account').click
      end
      alias :create :home
    end
  end
end
