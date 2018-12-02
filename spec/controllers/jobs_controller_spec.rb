# frozen_string_literal: true

require 'rails_helper'

describe JobsController do
  context 'When logged in as superadmin' do
    login_superadmin

    describe 'POST #create' do
      it 'should create job' do
        organization = create(:organization)
        job_params = FactoryGirl.attributes_for(:job, organization_id: organization)
        expect { post :create, params: { job: job_params, organization_id: organization } }.to change(Job, :count).by(1)
      end
    end

    context 'Can manipulate job' do
      before(:all) do
        @organization = create(:organization)
        @job = create(:job, organization: @organization)
      end

      describe 'GET #edit' do
        it 'renders the edit view' do
          get :edit, params: { id: @job.id }
          expect(response).to render_template :edit
        end
      end
      describe 'POST #update' do
        it 'updates a job and redirects to show' do
          job_params = { job_type: 'part_time' }
          put :update, params: { id: @job.id, job: job_params }
          expect(response).to redirect_to(job_path(id: @job.id))
        end
      end
      describe 'POST #destroy' do
        it 'deletes the job and redirects to show organization' do
          expect { put :destroy, params: { id: @job.id } }.to change(Job, :count).by(-1)
          expect(response).to redirect_to(organization_path(id: @organization.id))
        end
      end
    end

    describe 'GET #show for a waiting_approval organization job' do
      it 'should render the show view' do
        organization = create(:organization, :waiting_approval)
        create(:job, organization: organization)
        get :show, params: { id: organization.jobs.first }
        expect(response).to render_template :show
      end
    end
  end

  context 'When logged in as student' do
    login_student

    describe 'GET #show for an active organization job' do
      it 'renders the show view' do
        organization = create(:organization, :active)
        create(:job, organization: organization)
        get :show, params: { id: job.id }
        expect(response).to render_template :show
      end
    end

    describe 'GET #show for a waiting_approval organization job' do
      it "shouldn't render the show view" do
        organization = create(:organization, :waiting_approval)
        create(:job, organization: organization)
        get :show, params: { id: organization.jobs.first }
        expect(response).not_to render_template :show
      end
    end
  end
end
