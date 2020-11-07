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
