# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

person1=Salesperson.new

person1["first_name"]="Jane"
person1["last_name"]="Doe"
person1["email"]="jane.doe@gmail.com"
person1.save

person2=Salesperson.new

person2["first_name"]="John"
person2["last_name"]="Doe"
person2["email"]="john.doe@gmail.com"
person2.save

# 3. write code to display how many salespeople rows are in the database

puts "Salespeople: #{Salesperson.all.count}"
# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
p1update=Salesperson.find_by({"first_name"=> "Jane"})
p1update["last_name"]="McDone"
p1update.save 


# CHALLENGE:
# 5. write code to display each salesperson's full name
for i in Salesperson.all
    puts "#{i["first_name"]} #{i["last_name"]}"
    
    #alternatively
    #first_name = i["first_name"]
    #last_name= i["last_name"]
    #puts "#{first_name} #{last_name}"
end
# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
