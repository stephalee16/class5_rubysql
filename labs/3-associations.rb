# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

apple=Company.find_by({"name"=> "Apple"})
cook=Contact.find_by({"last_name"=> "Cook"})
sales1=Salesperson.find_by({"first_name"=> "Jane"})

activity1=Activity.new
activity1["notes"]="coffee chat"
activity1["contact_id"]= cook["id"]
activity1["salesperson_id"]=sales1["id"]
activity1.save

activity2=Activity.new
activity2["notes"]="lunch at Ding Tai Fung"
activity2["contact_id"]= cook["id"]
activity2["salesperson_id"]=sales1["id"]
activity2.save


bezos=Contact.find_by({"last_name"=> "Bezos"})

activity3=Activity.new
activity3["notes"]="coffee chat"
activity3["contact_id"]= bezos["id"]
activity3["salesperson_id"]=sales1["id"]
activity3.save

puts "#{Activity.all.count}"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

sales1_log=Activity.where("contact_id"=>cook["id"], "salesperson_id"=> sales1["id"])

puts "Activities between #{sales1["first_name"]} and #{cook["first_name"]} #{cook["last_name"]}"
for i in sales1_log
    puts "#{i["notes"]}"
end


# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
