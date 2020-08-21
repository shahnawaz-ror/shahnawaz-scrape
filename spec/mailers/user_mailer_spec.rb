require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "send_csv" do
    let(:mail) { UserMailer.send_csv }

    it "renders the headers" do
      expect(mail.subject).to eq("Send csv")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
