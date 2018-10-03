# frozen_string_literal: true

require 'test_helper'

class JobPostingAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_posting_answer = job_posting_answers(:one)
  end

  test 'should get index' do
    get job_posting_answers_url
    assert_response :success
  end

  test 'should get new' do
    get new_job_posting_answer_url
    assert_response :success
  end

  test 'should create job_posting_answer' do
    assert_difference('JobPostingAnswer.count') do
      post job_posting_answers_url, params: { job_posting_answer: { content: @job_posting_answer.content, job_application_id: @job_posting_answer.job_application_id } }
    end

    assert_redirected_to job_posting_answer_url(JobPostingAnswer.last)
  end

  test 'should show job_posting_answer' do
    get job_posting_answer_url(@job_posting_answer)
    assert_response :success
  end

  test 'should get edit' do
    get edit_job_posting_answer_url(@job_posting_answer)
    assert_response :success
  end

  test 'should update job_posting_answer' do
    patch job_posting_answer_url(@job_posting_answer), params: { job_posting_answer: { content: @job_posting_answer.content, job_application_id: @job_posting_answer.job_application_id } }
    assert_redirected_to job_posting_answer_url(@job_posting_answer)
  end

  test 'should destroy job_posting_answer' do
    assert_difference('JobPostingAnswer.count', -1) do
      delete job_posting_answer_url(@job_posting_answer)
    end

    assert_redirected_to job_posting_answers_url
  end
end
