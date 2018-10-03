# frozen_string_literal: true

require 'rails_helper'

describe OrganizationsController do
  context 'When logged in as superadmin' do
    login_superadmin

    describe 'GET #new' do
      it 'renders the new view' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create with valid params' do
      it 'creates a new org' do
        organization_params = FactoryGirl.attributes_for(:organization)
        expect { post :create, params: { organization: organization_params } }.to change(Organization, :count).by(1)
      end
    end

    # should be in model spec
    describe 'POST #create with invalid params' do
      it "doesn't create a new org" do
        organization_params = FactoryGirl.attributes_for(:organization, :invalid)
        expect { post :create, params: { organization: organization_params } }.to change(Organization, :count).by(0)
      end
    end

    describe 'POST #update' do
      it 'update the org, and redirect to show it' do
        organization = create(:organization)
        organization_params = { name: Faker::Team.name }
        put :update, params: { id: organization.id, organization: organization_params }
        expect(response).to redirect_to(organization)
      end
    end

    describe 'POST #destroy' do
      it 'destroys the org, and redirects to index' do
        organization = create(:organization)
        expect { put :destroy, params: { id: organization.id } }.to change(Organization, :count).by(-1)
        expect(response).to redirect_to('/organizations')
      end
    end

    describe 'GET #admin' do
      it 'renders the admin view' do
        get :admin
        expect(response).to render_template :admin
      end
    end

    context 'Can change org statuses' do
      before(:all) do
        @organization = create(:organization, :active)
      end

      describe 'GET #withdraw' do
        it 'withdraws permission for the organization' do
          get :withdraw, params: { id: @organization }
          @organization.reload
          expect(@organization.status).to eql('waiting_approval')
        end
      end

      describe 'GET #approve' do
        it 'approves the organization' do
          get :approve, params: { id: @organization }
          @organization.reload
          expect(@organization.status).to eql('active')
        end
      end

      describe 'GET #archive' do
        it 'archives the organization' do
          get :archive, params: { id: @organization }
          @organization.reload
          expect(@organization.status).to eql('archived')
        end
      end
    end

    describe 'GET #manage' do
      it 'renders the manage view' do
        get :manage
        expect(response).to render_template :manage
      end
    end
  end

  context 'When logged in as student' do
    login_student

    describe 'GET #index' do
      render_views
      it 'renders the index view' do
        get :index
        expect(response).to render_template :index
      end

      it 'lists at least one active org' do
        organization = create(:organization, :active)
        get :index
        expect(response.body).to have_content(organization.name)
      end

      it 'does not list waiting_approval orgs' do
        organization = create(:organization, :waiting_approval)
        get :index
        expect(response.body).not_to have_content(organization.name)
      end

      it 'does not list archived orgs' do
        organization = create(:organization, :archived)
        get :index
        expect(response.body).not_to have_content(organization.name)
      end
    end

    describe 'GET #new' do
      it 'does not render the new view' do
        get :new
        expect(response).not_to render_template :new
      end
    end

    describe 'POST #create with valid params' do
      it 'does not creates a new org, no permissions' do
        organization_params = FactoryGirl.attributes_for(:organization)
        expect { post :create, params: { organization: organization_params } }.to change(Organization, :count).by(0)
      end
    end

    describe 'GET #show for an active org' do
      it 'renders the show view' do
        organization = create(:organization, :active)
        get :show, params: { id: organization.id }
        expect(response).to render_template :show
      end
    end
    describe 'GET #show for a waiting_approval org' do
      it 'does not render the show view' do
        organization = create(:organization, :waiting_approval)
        get :show, params: { id: organization.id }
        expect(response).not_to render_template :show
      end
    end

    describe 'GET #user' do
      render_views
      it "render the user view with a user's organization" do
        organization = create(:organization)
        job = create(:job, organization: organization)
        create(:position, user: subject.current_user, job: job)
        get :user
        expect(response).to render_template :user
        expect(response.body).to have_content(organization.name)
      end
    end

    # if cannot render admin view, assume that they cannot do any other actions
    describe 'GET #admin' do
      it 'does not render the admin view' do
        get :admin
        expect(response).not_to render_template :admin
      end
    end

    context "Can't change org statuses" do
      before(:all) do
        @organization = create(:organization, :active)
      end

      describe 'GET #withdraw' do
        it 'does not withdraw permission for the organization' do
          get :withdraw, params: { id: @organization }
          @organization.reload
          expect(@organization.status).not_to eql('waiting_approval')
        end
      end
    end
  end
end
