namespace :app do
  # Populates development data
  desc "Populate the database with development data."
  task :populate => :environment do
    # INSERT BELOW

    [
      { :title => "The Engagement", :introduction => "", :when => "2011-09-24 14:00:00", :permalink => "engagement" },
      { :title => "The Wedding", :introduction => "", :when => "2012-01-06 15:00:00", :permalink => "wedding" }
    ].each do |attributes|
      Registry.find_or_create_by_permalink(attributes)
    end
    
    [
      { :name => "James Angus", :phone => "0409359315", :email => "ejangidotcom@gmail.com", :street => "59 Almeida St", :suburb => "Indooroopilly", :postcode => "4068", :password => "433292", :password_confirmation => "433292" }
    ].each do |attributes|
      User.find_or_create_by_email(attributes)
    end
  end
end