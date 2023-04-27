# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company

puts "Companies: #{Company.all.count}"
puts "Contacts: #{Contact.all.count}"

apple=Company.find_by({"name"=> "Apple"})

cook=Contact.new
cook["first_name"]="Tim"
cook["last_name"]="Cook"
cook["email"]="t.cook@apple.com"
cook["company_id"]= apple["id"]
cook.save

contact=Contact.new
contact["first_name"]="Craig"
contact["last_name"]="Federighi"
contact["email"]="c.federighi@apple.com"
contact["company_id"]= apple["id"]
contact.save

bezos=Contact.new
bezos["first_name"]="Jeff"
bezos["last_name"]="Bezos"
bezos["email"]="bezos@amazon.com"
bezos["company_id"]= Company.find_by({"name"=>"Amazon"})["id"]
bezos.save

puts "Contacts: #{Contact.all.count}"
# 2. How many contacts work at Apple?

apple_contacts= Contact.where({"company_id"=> apple["id"]})
puts "Apple Contacts: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

for i in apple_contacts
    first=i["first_name"]
    last=i["last_name"]
    puts "#{first} #{last}"
end
