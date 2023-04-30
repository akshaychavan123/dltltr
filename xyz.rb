# spec/admin/account_block/account_admin_spec.rb

require "rails_helper"

RSpec.describe "User", type: :feature do
#   let(:admin_user) { create(:admin_user) }
    admin_user = AdminUser.create(email: "aksah@455.com" , password: "ankdjkaj@kmskd")
#   let!(:user) { create(:account_block_account) }
    user = FactoryBot.create(:account_block_account)

  before do
    login_as admin_user
  end

  describe "Index" do
    it "displays the users" do
      visit admin_users_path
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.status)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.app_language.name)
    end

    it "allows admin to delete a user" do
      visit admin_account_block_accounts_path
      within("#user_#{user.id}") do
        click_link "delete"
      end
      expect(page).to have_content("#{user.first_name}'s status changes to deleted")
      expect(user.reload.status).to eq("deleted")
    end
  end

  describe "Show" do
    it "displays the user details" do
      visit admin_user_path(user)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.status)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.app_language.name)
      expect(page).to have_content(user.created_at.to_date)
      expect(page).to have_content(user.updated_at.to_date)
    end
  end

  describe "Edit" do
    it "updates the user details" do
      visit edit_admin_user_path(user)
      fill_in "First name", with: "New first name"
      click_button "Update User"
      expect(page).to have_content("User was successfully updated.")
      expect(user.reload.first_name).to eq("New first name")
    end
  end
end
