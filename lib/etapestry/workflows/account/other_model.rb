module ETapestry
  module Account
    OtherModel = Watirmark::Model::Base.new(*OtherView.keywords) do
      default.name          {"name_#{uuid}"}
      default.sort_name     {name}
    end
  end
end