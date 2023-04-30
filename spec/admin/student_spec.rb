require 'rails_helper'

RSpec.describe "AdminStudents", type: :request do
  describe "GET /admin/students/:id" do
    admin_user = AdminUser.create(email: "w@nnjsnsd,kjjh.jhdj" , password: "akskjakj@jwdj")
    let(:student) { FactoryBot.create(:student) }
    
    before do
      login_as admin_user
    end
    
    it "displays the student details" do
      visit admin_student_path(student)
     
      expect(page).to include(student.name)
      expect(response.body).to include(student.age.to_s)
    end
  end
end
