# frozen_string_literal: true

require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get organizations_new_url
    assert_response :success
  end
end
