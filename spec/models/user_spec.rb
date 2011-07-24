require 'spec_helper'

describe User do
  it "generates a key on save" do
    user = User.create({ :name => "James Angus", :phone => "0409359315", :email => "ejangidotcom@gmail.com", :street => "59 Almeida St", :suburb => "Indooroopilly", :postcode => "4068", :password => "111111", :password_confirmation => "111111" })
    user.key.should == "7c0c0e321b6fd65fe59b77b4a6e52ef5b4f25c96"
  end
  
  it "can be admitted to registries" do
    user = User.create({ :name => "James Angus", :phone => "0409359315", :email => "ejangidotcom@gmail.com", :street => "59 Almeida St", :suburb => "Indooroopilly", :postcode => "4068", :password => "111111", :password_confirmation => "111111" })
    registry1 = Registry.create({ :title => "The Engagement", :introduction => "", :when => "2011-09-24 14:00:00", :permalink => "engagement" })
    registry2 = Registry.create({ :title => "The Wedding", :introduction => "", :when => "2012-01-06 15:00:00", :permalink => "wedding" })
    all = Registry.all
    all.each do |registry|
      user.admit_to_registry(registry)
    end
    user.save
    user.admissions.count.should == 2
  end
end
