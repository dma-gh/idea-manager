class SendProjectAlertsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sms = SMSEasy::Client.new
    projects = Project.all
    
    today = Date.today
    
    projects.each do |project|
      project.events.each do |event|
        days_until_deadline = (Date.parse(event.deadline.to_s) - Date.today).to_i
	puts days_until_deadline
        if days_until_deadline <= 1 and days_until_deadline > -1 and !today.on_weekend? and !event.complete and !project.archived then
          #Event is due soon
          project.people.each do |person|
            sms.deliver(person.phone, person.carrier, "Event '#{event.title}' is due in #{days_until_deadline} day(s) for asssigned project '#{project.title}'")
          end
        end
      end
    end
  end
end
