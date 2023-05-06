require 'rails_helper'
require "spec_helper"
# require Warden::Test::Helpers

RSpec.describe Admin::UsersController, type: :controller do
  let!(:user) { create(:account) }
  let!(:admin_user) { create(:admin_user) }

  # admin_user = Admin_user.create(email: "akshay@420.com" , password: "Akshay@420")

  before do
    sign_in admin_user
  end

  describe "PUT #delete_user" do
    it "updates the status of the user to deleted" do
      put :delete_user, params: { id: user.id }
      user.reload
      expect(user.status).to eq("deleted")
    end

    it "redirects to the index page with a notice message" do
      put :delete_user, params: { id: user.id }
      expect(response).to redirect_to(admin_users_path)
      
    end
  
end
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)

    end
  end


  describe "GET #edit" do
    it "renders the edit template" do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end

    it "assigns the user to the view" do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)

    end

    it "assigns the user to the view" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      
    end
  end

  describe "PUT #update" do
    it "updates the user's attributes" do
      put :update, params: { id: user.id, user: { first_name: "New First Name" } }
      user.reload
      expect(user.first_name).to eq("John")
    end

    it "redirects to the show page with a notice message" do
      put :update, params: { id: user.id, user: { first_name: "New First Name" } }
      expect(response).to redirect_to(admin_user_path(user))
      expect(flash[:notice]).to be_present
    end
  end
end












require 'rails_helper'


RSpec.describe Admin::UsersController, type: :controller do
  let(:admin_user) { create(:admin_user) }
  before do
    
    sign_in  admin_user
  end

  describe "#index" do
 
    it "should display the list of users" do
      user1 = create(:account, first_name: "John")
      user2 = create(:account, first_name: "Doe")

      get :index

      expect(assigns(:users)).to include(user1, user2)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#edit" do
    it "should render the edit page for the user" do
      user = create(:account)

      get :edit, params: { id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#update" do
    let(:user) { create(:account, first_name: "John") }

    it "should update the user's attributes" do
      put :update, params: { id: user.id, user: { first_name: "Jane"  } }
      user.reload
      expect(user.first_name).to eq("Jane")
      expect(flash[:notice]).to eq("User updated successfully.")
      expect(response).to redirect_to(admin_users_path)
    end

    it "should not update the user's attributes if invalid" do
      put :update, params: { id: user.id, user: { first_name: nil } }

      user.reload
      expect(user.first_name).to eq("John")
      expect(flash[:alert]).to eq("User could not be updated.")
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #index" do
  let(:user) { create(:account, first_name: "John") }
  
  it "displays Edit, View, and delete links for each user" do
    login_as  admin_user
    redirect_to admin_users_path(wait: 10)
    debugger
    # expect(page).to include(First_name)
    # expect(page).to have_content('Doe')
    expect(page).to have_link('Edit', href: edit_admin_user_path(user))
# expect(page).to have_link('View', href: admin_url_for(action: 'show', controller: 'admin/users', id: user.id))
# expect(page).to have_link('delete', href: admin_url_for(action: 'delete_user', controller: 'admin/users', id: user.id), method: :put)

    # expect(response.request).to include(Last_name)

    # expect(response.request).to include(Status)

    # expect(response.request).to include(app_language)

    # expect(response).to include(admin_user_path(user))
    # expect(response).to include(delete_user_admin_user_path(user))
  end
end

describe "PUT #delete_user" do
  it "updates the user's status to deleted" do
    put :delete_user, params: { id: user.id }
    expect(user.reload.status).to eq("deleted")
  end

  it "redirects to the users index page" do
    put :delete_user, params: { id: user.id }
    expect(response).to redirect_to(admin_users_path)
  end

  it "displays a success message" do
    put :delete_user, params: { id: user.id }
    expect(flash[:notice]).to eq("#{user.first_name}'s status changes to deleted")
  end
end

  describe "#delete_user" do
    let(:user) { create(:account) }

    it "should delete the user" do
      put :delete_user, params: { id: user.id }

      user.reload
      expect(user.status).to eq("deleted")
      expect(flash[:notice]).to eq("#{user.first_name}'s status changes to #{user.status}")
      expect(response).to redirect_to(admin_users_path)
    end
  end
end






# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true


  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  config.include Warden::Test::Helpers


  # Capybara
  config.include Capybara::DSL, type: :request

  # Add custom configurations below
end
