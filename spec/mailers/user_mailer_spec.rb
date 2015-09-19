describe UserMailer do

  let(:user) { create(:unconfirmed_user) }
  let(:confirmation_email) { UserMailer.confirmation_instructions(user, user.confirmation_token) }
  let(:password_reset_email) { UserMailer.reset_password_instructions(user, user.reset_password_token) }

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    ActionMailer::Base.deliveries.clear
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context 'confirmation email' do

    it 'should send a confirmation email', :vcr, record: :new_episodes do
      confirmation_email.deliver_now
      expect(ActionMailer::Base.deliveries.count).to be(1)
    end

    it 'should send to the correct recipient', :vcr, record: :new_episodes do
      expect(confirmation_email).to deliver_to(user.email)
    end

    it 'should set the correct subject', :vcr, record: :new_episodes do
      expect(confirmation_email).to have_subject("Email confirmation")
    end

    it 'should send from the correct address', :vcr, record: :new_episodes do
      expect(confirmation_email).to deliver_from("coreypsoinos@gmail.com")
    end

  end

  context 'password reset email' do

    it 'should send a reset password email', :vcr, record: :new_episodes do
      password_reset_email.deliver_now
      expect(ActionMailer::Base.deliveries.count).to be(1)
    end

    it 'should send to the correct recipient', :vcr, record: :new_episodes do
      expect(password_reset_email).to deliver_to(user.email)
    end

    it 'should set the correct subject', :vcr, record: :new_episodes do
      expect(password_reset_email).to have_subject("Password Reset")
    end

    it 'should send from the correct address', :vcr, record: :new_episodes do
      expect(password_reset_email).to deliver_from(ENV["SMTP_USERNAME"])
    end

  end

end
