# Browser class to handle the browser initialize/destroy workflow
module Browser
  def self.setup_browser
    ENV['BROWSER'] = 'headless' unless ENV['BROWSER']
    browser_name = ENV['BROWSER'].downcase.to_sym

    if browser_name == :headless
      @headless = Headless.new dimensions: '1920x1080x24'
      @headless.start
      @browser = Selenium::WebDriver.for :firefox
    else
      @browser = Selenium::WebDriver.for browser_name
    end
    maximize_browser_window(browser_name)
    @browser
  end

  def self.tear_down
    @browser.close
    @headless.destroy if @headless
  end

  def self.maximize_browser_window(browser)
    if OS.host_os == :macosx && browser == :chrome
      position = @browser.manage.window.position
      if position.x + position.y > 0
        position.x = 0
        position.y = 0
        @browser.manage.window.position = position
      end
      max_width, max_height = @browser.execute_script('return [window.screen.availWidth, window.screen.availHeight];')
      @browser.manage.window.resize_to(max_width, max_height)
    else
      @browser.manage.window.maximize
    end
  end
end
