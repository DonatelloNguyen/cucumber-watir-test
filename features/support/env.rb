require 'watir'
require 'watir-webdriver'
require 'rubygems'



Before do
@browser = Watir::Browser.new :chrome
@browser.window.maximize
end
After do |scenario|
  if scenario.failed?
    screenshot = "./FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    encoded_img = @browser.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
  end
end
