require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  u = User.new
  u.first_name = row['first_name']
  u.last_name = row['last_name']
  u.title = row['title']
  u.manager_id = row['manager_id']
  u.save
  puts "#{u.first_name} #{u.last_name} saved"
end

puts "There are now #{User.count} rows in the users table"