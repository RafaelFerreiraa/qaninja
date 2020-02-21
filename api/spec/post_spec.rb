
describe "POST" do
    
    context "Quando é un novo usuário" do
        let(:resultado) { ApiUser.save(build(:user).to_hash) }

        it { expect(resultado.response.code).to eql "200" }
    end

    context "Quando email duplicado" do
        let(:resultado) { ApiUser.save(build(:registered_user).to_hash) }

        it { expect(resultado.response.code).to eql "409" }
        it { expect(resultado.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
    end

    context "Quando email inválido" do
        let(:resultado) { ApiUser.save(build(:user_wrong_email).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
    end

    context "Quando nome vazio" do
        let(:resultado) { ApiUser.save(build(:empty_name_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
    end

    context "Quando email vazio" do
        let(:resultado) { ApiUser.save(build(:empty_email_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
    end

    context "Quando senha vazio" do
        let(:resultado) { ApiUser.save(build(:empty_password_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
    end

    context "Quando nome é nulo" do
        let(:resultado) { ApiUser.save(build(:null_name_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.full_name cannot be null" }
    end

    context "Quando email é nulo" do
        let(:resultado) { ApiUser.save(build(:null_email_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.email cannot be null" }
    end

    context "Quando senha é nulo" do
        let(:resultado) { ApiUser.save(build(:null_password_user).to_hash) }

        it { expect(resultado.response.code).to eql "412" }
        it { expect(resultado.parsed_response["msg"]).to eql "Users.password cannot be null" }
    end
end