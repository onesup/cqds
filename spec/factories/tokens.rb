# Read about factories at https://github.com/thoughtbot/factory_girl
# TOKEN = YAML.load_file("#{Rails.root}/config/test_token.yml")
FactoryGirl.define do

  factory :token do
    access_token "CAACXBiZAsz5cBAKaukrkfzZCTYxRUsijqMZCJbF1MKMBLnrvV8jkfKk8z67SPrP03JZCvEgAL6g5xx8oCtHAudCbwr2JX4RHC0CvT67uQV6D1LpgyUZCU8Wv5mLMFKnMsofe4QoZABHn2vVkOyQqaLdVrfaqylAvWKwAeRbWsove4gRk2Of5XxmJZAtzDAZAebQZD"
  end
end