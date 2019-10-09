require_relative( "../models/member.rb" )
require_relative("../models/activity.rb")
require_relative( "../models/registration.rb" )
require("pry-byebug")

Registration.delete_all()
Member.delete_all()
Activity.delete_all()

member1 = Member.new({
"first_name" => "Raffaele",
"last_name" => "Castaldo"
})

member1.save()

member2 = Member.new({
"first_name" => "Silvia",
"last_name" => "Antonacci"
})

member2.save()

activity1 = Activity.new({
"class_name" => "Yoga",
"day" => "Monday",
"class_time" => "20:00"
})

activity1.save()

activity2 = Activity.new({
"class_name" => "Cycle",
"day" => "Tuesday",
"class_time" => "21:00"
})

activity2.save()

registration1 = Registration.new({
"member_id" => member1.id,
"activity_id" => activity1.id
})

registration1.save()

registration2 = Registration.new({
"member_id" => member2.id,
"activity_id" => activity2.id
})

registration2.save()

binding.pry
nil
