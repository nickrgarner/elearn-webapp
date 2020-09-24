require 'rails_helper'

RSpec.describe SessionsController do
    describe "User" do
        it "should be able to login" do
            user = create(:profile)
            post :create, params: {email: user.email, password: user.password}
          expect(response).to redirect_to(home_path)
        end
        it "should not be able to login" do
            user = create(:profile)
            post :create, params: {email: "wrong@email.com", password: "wrongpassword"}
          expect(response).to render_template(:new)
        end
    end
end