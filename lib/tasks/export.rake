 namespace :export do
  # Populates development data
  desc "Export users to tmp/engagement.csv"
  task :engagement => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/engagement.csv')
    columns = User.column_names.to_a
    users = User.find_by_role("engagement")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/engagementnotrsvpd.csv"
  task :engagementnotrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/engagementnotrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.number_of_guests IS NULL AND rsvps.attending = 0 AND registries.permalink = 'engagement')
    	OR rsvps.attending IS NULL
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/engagementrsvpd.csv"
  task :engagementrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/engagementrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.attending = 1 AND registries.permalink = 'engagement')
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  # Populates development data
  desc "Export users to tmp/wedding.csv"
  task :wedding => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/wedding.csv')
    columns = User.column_names.to_a
    users = User.find_by_role("wedding")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/weddingnotrsvpd.csv"
  task :weddingnotrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/weddingnotrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.number_of_guests IS NULL AND rsvps.attending = 0 AND registries.permalink = 'wedding')
    	OR rsvps.attending IS NULL
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/weddingrsvpd.csv"
  task :weddingrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/weddingrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.attending = 1 AND registries.permalink = 'wedding')
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end

    # Populates development data
  desc "Export users to tmp/bucksparty.csv"
  task :bucksparty => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/bucksparty.csv')
    columns = User.column_names.to_a
    users = User.find_by_role("bucksparty")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/buckspartynotrsvpd.csv"
  task :buckspartynotrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/buckspartynotrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.number_of_guests IS NULL AND rsvps.attending = 0 AND registries.permalink = 'bucksparty')
      OR rsvps.attending IS NULL
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/buckspartyrsvpd.csv"
  task :buckspartyrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/buckspartyrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.attending = 1 AND registries.permalink = 'bucksparty')
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end

    # Populates development data
  desc "Export users to tmp/bridalshower.csv"
  task :bridalshower => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/bridalshower.csv')
    columns = User.column_names.to_a
    users = User.find_by_role("bridalshower")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/bridalshowernotrsvpd.csv"
  task :bridalshowernotrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/bridalshowernotrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.number_of_guests IS NULL AND rsvps.attending = 0 AND registries.permalink = 'bridalshower')
      OR rsvps.attending IS NULL
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
  
  
  # Export list of people who haven't RSVP'd yet
  desc "Export users to tmp/bridalshowerrsvpd.csv"
  task :bridalshowerrsvpd => :environment do
    text = ""
    file = File.expand_path(File.dirname(__FILE__) + '/../../tmp/bridalshowerrsvpd.csv')
    columns = User.column_names.to_a
    users = User.find_by_sql("SELECT users.*
    FROM users 
    LEFT JOIN rsvps ON rsvps.user_id = users.id 
    LEFT JOIN registries ON rsvps.registry_id = registries.id
    WHERE (rsvps.attending = 1 AND registries.permalink = 'bridalshower')
    GROUP BY users.id")
    
    text << '"' + columns.join('","') + '"' + "\n"
    
    users.each do |user|
      hash = user.attributes
      line = []
      columns.each do |column|
        line << hash[column]
      end
      text << '"' + line.join('","') + '"' + "\n"
    end
    
    File.open(file, 'w') { |f| f.write(text) }
  end
end