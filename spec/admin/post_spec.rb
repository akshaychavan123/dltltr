require 'rails_helper'

RSpec.describe "Admin::Teacher::Posts", type: :feature do
  # let(:admin_user) { FactoryBot.create(:admin_user) }
  admin_user = AdminUser.create(email: "w@nnjsnsd,kjjh.jhdj" , password: "akskjakj@jwdj")
  let(:student) { FactoryBot.create(:student) }
  
  before do
    debugger
    sign_in admin_user
  end
  
  describe "create teacher post" do
    it "creates a new teacher post" do
      visit new_admin_teacher_path
      
      fill_in "Title", with: "New Teacher Post"
     
      
      click_button "Create Post"
      
      # expect(page).to have_text("Post was successfully created.")
      expect(Post.last.title).to eq("New Teacher Post")
      expect(Post.last.student_id).to eq(student.id)
    end
  end
  
  describe "update teacher post" do
    let(:post) { FactoryBot.create(:post) }
    
    it "updates an existing teacher post" do
      visit edit_admin_teacher_post_path(post)
      
      fill_in "Title", with: "Updated Teacher Post"
      
      click_button "Update Post"
      
      expect(page).to have_text("Post was successfully updated.")
      expect(Post.last.title).to eq("Updated Teacher Post")
      expect(Post.last.student_id).to eq(post.student_id)
    end
  end
  
  describe "delete teacher post" do
    let(:post) { FactoryBot.create(:post) }
    
    it "deletes an existing teacher post" do
      visit admin_teacher_post_path(post)
      
      click_link "Delete"
      
      page.driver.browser.switch_to.alert.accept
      
      expect(page).to have_text("Post was successfully destroyed.")
      expect(Post.count).to eq(0)
    end
  end
end
