class Contact
  include ActiveModel::Model

  attr_accessor :title, :email, :body, :name

  validates :title, :email, :body, :name, presence: true
end
