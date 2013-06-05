
Given %r/^I am logged in as a student union employee$/ do
  FactoryGirl.create :eija
  visit "/dev_login?user=eija"
end

Given %r/^I am logged in as a member of university staff$/ do
  FactoryGirl.create :aaro
  visit "/dev_login?user=aaro"
end

Given %r/^I am logged in as a student$/ do
  FactoryGirl.create :student_martti
  visit "/dev_login?user=student_martti"
end

Given /^I am logged in as a student with no phone number$/ do
  stu = FactoryGirl.create :no_phone_student
  visit "/dev_login?user=no_phone_student"
  stu.phone.should == "0"
end

Given /^debugger$/ do
  debugger
end

Given /^the phone number should be (\d+)!!$/ do |arg1|
  User.count.should == 1
  User.first.phone.should == arg1
end



Then %r/^I should see logged in user "([^"]*)" with mail "([^"]*)" and phone "([^"]*)"$/ do |name, email, phone|
  check_that_contains_values '.profile-info', name, phone, email
  check_that_contains_values '.login-info', name
end


