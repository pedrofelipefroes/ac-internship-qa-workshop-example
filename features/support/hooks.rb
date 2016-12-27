Before do |_scenario|
  @browser = Browser.setup_browser
end

After do |scenario|
  if scenario.failed?
    @browser.save_screenshot "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png"
    embed "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png", 'image/png'
  end
  Browser.tear_down
end
