# Learn more: http://github.com/javan/whenever

every 1.day, :at => '7:30 am' do
  runner "SendProjectAlertsJob"
end