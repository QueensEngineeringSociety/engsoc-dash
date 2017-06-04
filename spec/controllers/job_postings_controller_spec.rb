require 'rails_helper'

describe JobPostingsController do

  before(:all) do
    # create necessary org, job, and jp test objects
    @active_org = create(:organization, :active)
    @job_active_org = create(:job, organization: @active_org)
    # these cases imply that two job postings can be created for a single job
    # inactive org related jps shouldn't show
    @inactive_org = create(:organization, :waiting_approval)
    @job_inactive_org = create(:job, organization: @inactive_org)
  end

  context "When logged in as superadmin" do
    login_superadmin

    describe "GET #new with specifying job_id" do
      it "should render new job posting template" do
        get :new, params: { :job_id => @job_active_org }
        expect(response).to render_template :new
      end
    end

    describe "GET #new without specifying job_id" do
      it "should not render new job posting template, should redirect to select" do
        get :new
        expect(response).to redirect_to("/job_postings/select")
      end
    end

    # describe "POST #create" do
    #   it "should redirect to job posting questions" do
    #     job_posting_params = FactoryGirl.attributes_for(:job_posting)
    #     post :create, params: { :job_posting => job_posting_params, :job_id => @job_active_org.id }
    #     expect(response).to render_template(job_posting_job_questions_path(JobPosting.last))
    #   end
    # end

    describe "GET #select" do
      render_views
      it "should show job postings without postings" do
        get :select
        expect(response.body).to have_content(@job_active_org.title)
      end
    end

    # edit
    # update
    # destroy
    # approve, withdraw, interview, manage

    describe "GET #admin" do
      render_views
      it "renders the admin view" do
        get :admin
        expect(response).to render_template :admin
      end
      it "shows open postings for active organizations" do
        open_jp_active_org = create(:job_posting, :open, job: @job_active_org)
        get :admin
        expect(response.body).to have_content(open_jp_active_org.title)
      end
      it "shows waiting_approval postings for active organizations" do
        waiting_approval_jp_active_org = create(:job_posting, :waiting_approval, job: @job_active_org)
        get :admin
        expect(response.body).to have_content(waiting_approval_jp_active_org.title)
      end
      it "shows closed postings for active organizations" do
        closed_jp_active_org = create(:job_posting, :closed, job: @job_active_org)
        get :admin
        expect(response.body).to have_content(closed_jp_active_org.title)
      end
      it "shows open postings for inactive organizations" do
        open_jp_inactive_org = create(:job_posting, :open, job: @job_inactive_org)
        get :admin
        # expect(response.body).not_to have_content(open_jp_inactive_org.title)
        expect(response.body).to have_content(@inactive_org.name)
        # maybe it should note that it is a posting for an inactive organization?
      end
    end

    context "Can change job posting statuses" do
      before(:all) do
        @posting = create(:job_posting, :open, job: @job_active_org)
      end

      describe "GET #edit" do
        it "renders the edit view" do
          get :edit, params: { id: @posting.id }
          expect(response).to render_template :edit
        end
      end
      describe "GET #withdraw" do
        it "withdraws permission for the posting" do
          get :withdraw, params: { :id => @posting }
          @posting.reload
          expect(@posting.status).to eql("waiting_approval")
        end
      end
      describe "GET #approve" do
        it "approves the posting" do
          get :approve, params: { :id => @posting }
          @posting.reload
          expect(@posting.status).to eql("open")
        end
      end
      describe "GET #interview" do
        it "sets status to be interviewing the posting" do
          get :interview, params: { :id => @posting }
          @posting.reload
          expect(@posting.status).to eql("interviewing")
        end
      end
    end

    # select


  end

  context "When logged in as student" do
    login_student

    describe "GET #index" do
      render_views
      it "renders the index view" do
        get :index
        expect(response).to render_template :index
      end
      it "shows open postings for active organizations" do
        open_jp_active_org = create(:job_posting, :open, job: @job_active_org)
        get :index
        expect(response.body).to have_content(open_jp_active_org.title)
      end
      it "shouldn't show waiting_approval postings for active organizations" do
        waiting_approval_jp_active_org = create(:job_posting, :waiting_approval, job: @job_active_org)
        get :index
        expect(response.body).not_to have_content(waiting_approval_jp_active_org.title)
      end
      it "shouldn't show closed postings for active organizations" do
        closed_jp_active_org = create(:job_posting, :closed, job: @job_active_org)
        get :index
        expect(response.body).not_to have_content(closed_jp_active_org.title)
      end
      it "shouldn't show open postings for inactive organizations" do
        open_jp_inactive_org = create(:job_posting, :open, job: @job_inactive_org)
        get :index
        # expect(response.body).not_to have_content(open_jp_inactive_org.title)
        expect(response.body).not_to have_content(@inactive_org.name)
      end
    end

    describe "GET #show" do
      it "render approved postings for active organizations" do
        open_jp_active_org = create(:job_posting, :open, job: @job_active_org)
        get :show, params: { id: open_jp_active_org }
        expect(response).to render_template :show
      end
      it "should not render waiting_approval postings for active organizations" do
        waiting_approval_jp_active_org = create(:job_posting, :waiting_approval, job: @job_active_org)
        get :show, params: { id: waiting_approval_jp_active_org }
        expect(response).not_to render_template :show
      end
      it "should not render open postings for inactive organizations" do
        open_jp_inactive_org = create(:job_posting, :open, job: @job_inactive_org)
        get :show, params: { id: open_jp_inactive_org }
        expect(response).not_to render_template :show
      end
    end

    describe "GET #new" do
      it "shouldn't render new job posting template" do
        get :new
        expect(response).not_to render_template :new
      end
    end

    describe "POST #create" do
      it "shouldn't create job posting" do
        job_posting_params = FactoryGirl.attributes_for(:job_posting)
        expect { post :create, params: { :job_posting => job_posting_params } }.to change(JobPosting, :count).by(0)
      end
    end

    describe "GET #edit" do
      it "shouldn't render edit job posting template" do
        open_jp_active_org = create(:job_posting, :open, job: @job_active_org)
        get :edit, params: { id: open_jp_active_org }
        expect(response).not_to render_template :edit
      end
    end

  end

end