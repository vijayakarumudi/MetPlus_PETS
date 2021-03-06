When(/^I go to the "(.+)" page$/) do |page|
  case page
    when 'JobSeeker Registration'
      visit new_jobseeker_path
    when 'homepage'
      visit root_path
    when /activation for user '.+'/
      user = page.match(/'(.+)'/)
      if user[1] =~ /@/
        visit activate_user_path(User.find_by_email(user[1]).activation_token)
      else
        visit activate_user_path user
      end
  end
end

Given(/I am on the (\w+)$/) do |page|
  step "I go to the #{page} page"
end