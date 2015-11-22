class Keychain < ActiveRecord::Base

  belongs_to :user

  validates :keyname, presence: true, length: {maximum: 16}
  validates :keyval, presence: true

  before_save {self.keyval = AESCrypt.encrypt(keyval, keyname)}

end
