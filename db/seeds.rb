if Rails.env.development? || ENV['SEED_ENABLE'].presence
  FactoryBot.create(:default_admin)
end
