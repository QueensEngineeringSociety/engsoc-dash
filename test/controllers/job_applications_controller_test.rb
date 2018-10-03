# frozen_string_literal: true

require 'test_helper'

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_application = job_applications(:one)
  end

  test 'should get index' do
    get job_applications_url
    assert_response :success
  end

  test 'should get new' do
    get new_job_application_url
    assert_response :success
  end

  test 'should create job_application' do
    assert_difference('JobApplication.count') do
      post job_applications_url, params: { job_application: {} }
    end

    assert_redirected_to job_application_url(JobApplication.last)
  end

  test 'should show job_application' do
    get job_application_url(@job_application)
    assert_response :success
  end

  test 'should get edit' do
    get edit_job_application_url(@job_application)
    assert_response :success
  end

  test 'should update job_application' do
    patch job_application_url(@job_application), params: { job_application: {} }
    assert_redirected_to job_application_url(@job_application)
  end

  test 'should destroy job_application' do
    assert_difference('JobApplication.count', -1) do
      delete job_application_url(@job_application)
    end

    assert_redirected_to job_applications_url
  end
end
