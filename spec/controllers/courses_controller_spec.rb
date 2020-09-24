require 'rails_helper'

RSpec.describe CoursesController do

    before do
        @user = FactoryBot.create(:profile)
        @request.session[:user_id] = @user.id
        @course = create(:course)
    end
    
    describe "Students" do
        it "should be able to view courses in their discipline" do
            get :index
            expect(response).to render_template(:index)
            expect(response).to have_http_status(:success)
            expect(assigns(:courses)).to_not be_nil
        end
        it "should be able to show an individual course" do
          get :show, params: {id: @course.id}
          expect(response).to render_template(:show)
          expect(response).to have_http_status(:success)
        end
        it "should not be able to create a course" do
          get :new
          expect(response).to redirect_to(home_path)
          expect(assigns(:course)).to be_nil
        end
        it "should not be able to edit a course" do
          get :edit, params: {id: @course.id}
          expect(response).to redirect_to(home_path)
        end
        it "should not be able to destroy a course" do
          get :destroy, params: {id: @course.id}
          expect(response).to redirect_to(home_path)
        end
    end
end
