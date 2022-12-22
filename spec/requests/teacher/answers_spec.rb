require 'rails_helper'

RSpec.describe "Teacher::Answers", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/teacher/answers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
