module ETapestry
  class AccountHeaderView < BaseView
    keyword(:name)        {header_section(2,1)}
    keyword(:user_role)   {header_section(0,2)}
    keyword(:address)     {header_section(3,1)}
    keyword(:email)       {header_section(3,1).link(:text, /@/)}
    keyword(:website)     {header_section(3,1).link(:text, /^((?!@).)*$/)}

    class << self
      def header
        content.div(:id, 'followMeDiv1')
      end

      def header_section(row, col)
        header.trs[row].tds[col]
      end

      alias :edit :home
    end
  end
end
