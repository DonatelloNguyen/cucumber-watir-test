#Admin

Given('a user logs in as admin') do
  @browser.goto("http://blowfish.tester-calendar.c66.me/")
  @browser.text_field(:id => "user_username").send_keys("admin1")
  @browser.text_field(:id => "user_password").send_keys("admin1")
  @browser.button(:name => "commit").click
end

When('admin creates event') do
  @browser.link(:visible_text => "Events").click
  @browser.button(:visible_text => "Add Event").click
  @browser.select_list(:id, "category_id").select("Sick")
  @browser.textarea(:id => "descr").send_keys("sik")
  @browser.select_list(:id => "creator_id").select("Bob (employee1) (employee)")
  @browser.button(:visible_text => "Save changes").click


end

Then('it should appear on pending')do
  @browser.select_list(:id, "event-filter-option").select("Pending")
  @browser.link(:visible_text => "Sick").wait_until(&:present?)

  sleep 4
end


#FailedItems
Given('Admin creates 2nd Event') do
  @browser.goto("http://blowfish.tester-calendar.c66.me/")
  @browser.text_field(:id => "user_username").send_keys("admin1")
  @browser.text_field(:id => "user_password").send_keys("admin1")
  @browser.button(:name => "commit").click
end

When('Admin adds 2nd event') do
  @browser.link(:visible_text => "Events").click
  @browser.button(:visible_text => "Add Event").click
  @browser.select_list(:id, "category_id").select("Sick")
  @browser.textarea(:id => "descr").send_keys("sik")
  @browser.select_list(:id => "creator_id").select("Bob (employee1) (employee)")
  @browser.button(:visible_text => "Save changes").click
  @browser.button(:visible_text => "Add Event").click
  @browser.select_list(:id, "category_id").select("Sick")
  @browser.textarea(:id => "descr").send_keys("bakasyon")


end
Then('Date picker should not show blank') do
  @browser.select_list(:id => "date-ranger").click
  filename = DateTime.now.strftime("bug"+"%d%b%Y%H%M%S")
  @browser.screenshot.save ("#{filename}.png")

  sleep 5

end

#Approve and Deny Request
Given('Employee logs in and create an Event') do
  @browser.goto("http://blowfish.tester-calendar.c66.me/")
  @browser.text_field(:id => "user_username").send_keys("employee1")
  @browser.text_field(:id => "user_password").send_keys("employee1")
  @browser.button(:name => "commit").click
  @browser.link(:visible_text => "Events").click
  @browser.button(:visible_text => "Add Event").click
  @browser.select_list(:id, "category_id").select("Sick")
  @browser.textarea(:id => "descr").send_keys("sik")
  @browser.button(:visible_text => "Save changes").click
  @browser.link(:visible_text => "Bob (employee1)").click
  @browser.link(:visible_text => "Log Out").click
end

When('Manager checks list') do
  @browser.text_field(:id => "user_username").send_keys("manager1")
  @browser.text_field(:id => "user_password").send_keys("manager1")
  @browser.button(:name => "commit").click
  @browser.link(:visible_text => "Events").click

end

Then('Manager Approves request') do
  @browser.span(:xpath => "id('eventTable')/tbody[1]/tr[@class='odd']/td[8]/div[@class='row']/div[@class='col-lg-6 col-md-12 col-sm-12']/button[@class='btn btn-basic change_status']/span[1]").click
  @browser.link(:text => "Approve").click
  @browser.link(:visible_text => "Elon Musk (manager1)").click
  @browser.link(:visible_text => "Log Out").click

end

Then('Manager declines the request') do

  @browser.table.row(:class => "row").exist?
  @browser.button(:text => "Deny").click
  @browser.link(:text => "Deny").click
  @browser.link(:visible_text => "Elon Musk (manager1)").click
  @browser.link(:visible_text => "Log Out").click
end

#Employee1 Manager 2 checks
When('Manager2 checks list') do
  @browser.text_field(:id => "user_username").send_keys("manager2")
  @browser.text_field(:id => "user_password").send_keys("manager2")
  @browser.button(:name => "commit").click
end

Then('Manager2 should not see the list') do
  @browser.link(:visible_text => "Events").click
  @browser.div(:visible_text => "No data available in table").present?
  filename = DateTime.now.strftime("screenshot"+"%d%b%Y%H%M%S")
  @browser.screenshot.save ("#{filename}.png")
end
