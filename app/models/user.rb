require 'digest/sha2'

class User < ActiveRecord::Base

  # prevents role from being set by mass assignment
  attr_protected :role

    attr_accessor :new_password, :new_password_confirmation
    validates_confirmation_of :new_password, :if=>:password_changed?
    validates :email, :uniqueness => { :case_sensitive => false }, :presence => true, :email => true
    validates :handle, :presence => true
    validates :new_password, :presence => true
    validates :new_password_confirmation, :presence => true

    before_save :hash_new_password, :if=>:password_changed?

    def password_changed?
      !@new_password.blank?
    end

    def self.authenticate(email, password)
      if user = find_by_email(email)
        if user.hashed_password == Digest::SHA2.hexdigest(user.salt + password)
          return user
        end
      end
      return nil
    end

    private

    def hash_new_password
      self.salt = ActiveSupport::SecureRandom.base64(8)
      self.hashed_password = Digest::SHA2.hexdigest(self.salt + @new_password)
    end

end
