module ApplicationHelper
  include Pagy::Frontend

  def pagy_get_params(params)
    params.except(:anything, :not, :useful).merge!(something: 'more useful')
  end  
end
