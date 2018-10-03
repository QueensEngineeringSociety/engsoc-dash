# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  context 'When logged in as superadmin' do
    login_superadmin

    describe 'GET #edit for own profile' do
      it 'renders the edit view' do
        get :edit, params: { id: subject.current_user.id }
        expect(response).to render_template :edit
      end
    end

    describe 'GET #edit for another profile' do
      it 'renders the edit view' do
        user = create(:student)
        get :edit, params: { id: user.id }
        expect(response).to render_template :edit
      end
    end

    describe 'GET #profiles index' do
      it 'renders the profiles view' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  context 'When logged in as student' do
    login_student

    describe 'GET #edit for own profile' do
      it 'renders the edit view' do
        get :edit, params: { id: subject.current_user.id }
        expect(response).to render_template :edit
      end
    end

    describe 'GET #edit for another profile' do
      it 'should not renders the edit view' do
        user = create(:student)
        get :edit, params: { id: user.id }
        expect(response).not_to render_template :edit
      end
    end

    describe 'GET #profiles index' do
      it 'should not render the profiles view' do
        get :index
        expect(response).not_to render_template :index
      end
    end
  end
end
