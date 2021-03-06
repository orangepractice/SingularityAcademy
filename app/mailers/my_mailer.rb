class MyMailer < ActionMailer::Base

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new ENV['MAILER_API_KEY']
  end

  def new_user(user)
    template_name = "new-user"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "Welcome to SingularityAcademy",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [{name: "USER_NAME", content: user.name}]
        }
      ]
    }

    mandrill_client.messages.send_template template_name, template_content, message
  end

  def new_receipt(user, project)
    template_name = "new-receipt"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "SingularityAcademy - Your Receipt",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [
            {name: "STUDENT_NAME", content: user.name},
            {name: "PROJECT_NAME", content: project.name},
            {name: "PROJECT_PRICE", content: project.price}
          ]
        }
      ]
    }
    
    mandrill_client.messages.send_template template_name, template_content, message
  end
  
end
