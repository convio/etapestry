module ETapestry
  class AccountHeaderView < BaseView
    keyword(:name)        {header(2,1)}
    keyword(:user_role)   {header(0,2)}
    keyword(:address)     {header(3,1)}
    keyword(:email)       {header(3,1).link(:text, /@/)}
    keyword(:website)     {header(3,1).link(:text, /^((?!@).)*$/)}

    class << self
      def header(row, col)
        content.div(:id, 'followMeDiv1').trs[row].tds[col]
      end

      alias :edit :home
    end
  end
end
