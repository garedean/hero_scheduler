class User < ActiveRecord::Base
  attr_accessor :login

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  def to_s
    username.capitalize
  end

  def upcoming_work_days
    WorkDay.where(user: self).where("date > ?", Time.zone.today)
  end

  # Below methods are used to configure Devise so that a username
  # is used for authentication without the need for an email address
  # http://stackoverflow.com/questions/9165843/devise-not-requiring-email
  # ---------------------------------------------------------------------
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username)
      where(conditions.to_hash).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
