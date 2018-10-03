# frozen_string_literal: true

module ControllerHelpers
  def login_superadmin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:superadmin]
      sign_in FactoryGirl.create(:superadmin) # Using factory girl as an example
    end
  end

  def login_student
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:student]
      sign_in FactoryGirl.create(:student)
    end
  end
end
