class NoOptionQuestion < Question
  has_one :answer, dependent: :destroy
end
