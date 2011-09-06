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
end