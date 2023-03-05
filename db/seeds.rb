10.times do
    Account.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        account_type: Account.account_types.keys.sample
    )
end
