
describe "post" do
    context "when new user" do
        let(:resultado) { ApiUser.save(build(:user).to_hash) }

        it { expect(resultado.response.code).to eql "200" }
    end

    context "when duplicate email" do
        let(:resultado) { ApiUser.save(build(:registered_user).to_hash) }

        it { expect(resultado.response.code).to eql "409" }
        it { expect(resultado.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
    end

    context "when wrong email" do
        let(:resultado) { ApiUser.save(build(:user_wrong_email).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
    end

    context "when empty name" do
        let(:resultado) { ApiUser.save(build(:empty_name_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
    end

    context "when empty email" do
        let(:resultado) { ApiUser.save(build(:empty_email_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
    end

    context "when empty password" do
        let(:resultado) { ApiUser.save(build(:empty_password_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
    end

    context "when name is null" do
        let(:resultado) { ApiUser.save(build(:null_name_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.full_name cannot be null" }
    end

    context "when email is null" do
        let(:resultado) { ApiUser.save(build(:null_email_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.email cannot be null" }
    end

    context "when password is null" do
        let(:resultado) { ApiUser.save(build(:null_password_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.password cannot be null" }
    end
end