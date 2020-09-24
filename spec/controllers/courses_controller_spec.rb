require 'rails_helper'

RSpec.describe CoursesController do

    before do
        @user = FactoryBot.create(:profile)
        @request.session[:user_id] = @user.id
        create(:course)
    end
    
    describe "Students" do
        it "should be able to view courses in their discipline" do
            get :index
            expect(response).to render_template(:index)
            expect(response).to have_http_status(:success)
        end
    end
end
