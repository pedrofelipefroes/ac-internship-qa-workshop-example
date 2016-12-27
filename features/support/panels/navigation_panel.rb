# Navigation panel mapping with navigation steps
class NavigationPanel
  include PageObject

  a :users, href: '/users'

  def initialize_page
    users_element.when_present(5)
  end

  def access_users_page
    wait_until { users_element.visible? }
    users
  end
end
