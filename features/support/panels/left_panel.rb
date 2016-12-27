# Left panel mapping with the other system links and logged user details
class LeftPanel
  include PageObject

  unordered_list  :left_panel_list, class: 'side-nav'
  div             :user_photo, class: 'avatar'

  button :login, class: 'ac-login-button'
  button :logout, class: 'ac-logout-button'

  def initialize_page
    left_panel_list_element.when_present(5)
  end

  def am_i_logged_in?
    logout_element.visible?
  end
end
