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
end