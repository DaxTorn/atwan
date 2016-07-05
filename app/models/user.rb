class User < ActiveRecord::Base
    has_and_belongs_to_many :servers

    before_save :encrypt_password
    after_save :clear_password

    validates :nickname, :email, :steamid, :password, presence: true
    validates :steamid, length: {is: 17}
    validates :password, confirmation: true
    validates :steamid, :nickname, uniqueness: true

    def encrypt_password
        md5 = Digest::MD5.new
        self.password = md5 << password
    end

    def clear_password
        self.password = nil
    end

end
