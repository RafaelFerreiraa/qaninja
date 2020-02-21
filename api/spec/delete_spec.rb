describe "DELETE" do

    context "Quando é um usuário registrado" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, user.id) }

        it { expect(resultado.response.code).to eql "204" }
    end

    context "Quando não existe" do
        let(:user) { build(:user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, user.id) }

        it { expect(resultado.response.code).to eql "404" }
    end

    context "Quando o ID é inválido" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password)}
        let(:resultado) { ApiUser.remove(token, "abc123") }

        it { expect(resultado.response.code).to eql "412" }
    end

end