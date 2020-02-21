describe "PUT" do

    context "Quando é un novo usuário" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:user)
            @resultadoPut = ApiUser.update(token, original_user.id, @new_user.to_hash)
            @resultadoGet = ApiUser.find(token, original_user.id)
        end

        it { expect(@resultadoPut.response.code).to eql "200" }
        it { expect(@resultadoGet.parsed_response["full_name"]).to eql @new_user.full_name }
        it { expect(@resultadoGet.parsed_response["email"]).to eql @new_user.email }
    end

    context "Quando email duplicado" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:registered_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "409" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
    end

    context "Quando email inválido" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:user_wrong_email)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "412" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
    end
    
    context "Quando nome vazio" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:empty_name_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
    end

    context "Quando email vazio" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:empty_email_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
    end

    context "Quando senha vazio" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:empty_password_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
    end

    context "Quando nome é nulo" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:null_name_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Users.full_name cannot be null" }
    end

    context "Quando email é nulo" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:null_email_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Users.email cannot be null" }
    end

    context "Quando senha é nulo" do
        before(:all) do
            original_user = build(:registered_user)
            token = ApiUser.token(original_user.email, original_user.password)
            @new_user = build(:null_password_user)
            @resultado = ApiUser.update(token, original_user.id, @new_user.to_hash)
        end

        it { expect(@resultado.response.code).to eql "400" }
        it { expect(@resultado.parsed_response["msg"]).to eql "Users.password cannot be null" }
    end


end