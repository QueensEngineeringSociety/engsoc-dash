# frozen_string_literal: true

Warden::Strategies.add(:interpret_headers) do
  def valid?
    # if Rails.env.production?
    #   # code here to check whether to try and authenticate using this strategy;
    #   return true
    # end
    false
  end

  def authenticate!
    user_email = request.headers['HTTP_EMAIL']
    user_givenName = request.headers['givenName']
    user_surname = request.headers['surname']
    p 'AUTHENTICATING NOW'
    p user_email
    p user_givenName
    p user_surname
    if user = User.where(email: user_email).first
      sign_in(:user, user)
      success!(user)
    else
      new_user = User.new(email: user_email,
                          first_name: user_givenName,
                          last_name: user_surname)
      if new_user.save
        sign_in(:user, new_user)
        success!(new_user)
      else
        p 'user creation failure'
        message = 'Could not initialize your account at this time, please contact 12sj16@queensu.ca'
        fail!(message)
      end
    end
  end
end
