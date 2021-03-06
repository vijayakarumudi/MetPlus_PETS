def wait_until
  require "timeout"
  #Timeout.timeout(Capybara.default_wait_time) do
  Timeout.timeout(10) do
    sleep(0.1) until value = yield
    value
  end
end
def search_text text
  wait_until do
    if text.is_a? Regexp
      expect(page).to have_content text
    else
      expect(page).to have_content text
    end
  end
end
Then(/^I should see "([^"]*)"$/) do |text|
  search_text text
end

And(/^I press "([^"]*)"$/) do |name|
  click_on name
end

Then(/^I should see "([^"]*)" between "([^"]*)" and "([^"]*)"$/) do |toSearch, first, last|
  regex = /#{first}.+#{toSearch}.+#{last}/
  search_text regex
end

Then(/^I wait for (\d+) seconds$/) do |seconds|
  sleep seconds.to_i.seconds
end