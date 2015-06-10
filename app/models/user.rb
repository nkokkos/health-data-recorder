class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :measurement_blocks
  has_many :measurements, through: :measurement_blocks

  has_and_belongs_to_many :chronic_diseases, join_table: :chronic_diseases_users

  has_many :patient_relationships
  has_many :patients, :through => :patient_relationships

  has_one :setting

  validates :height, :allow_nil => false, numericality: { only_integer: true }

  before_create :generate_access_token, :set_birth_date
  after_create  :update_setting_table

  def generate_access_token
    #call private nethod below
    private_generate_token
  end

  def set_birth_date
    self.birth_date = Time.now
  end

  def self.age_calculation(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end



  # used by rails_admin to display look up values correctly in /admin:
  # starts here:
  def family_status_id_enum
    FamilyStatus.all.map { |u| ["#{u.status}", u.id] }
  end

  def exercise_activity_id_enum
    ExerciseActivity.all.map { |u| ["#{u.description}", u.id] }
  end

  def smoking_frequency_id_enum
    SmokingFrequency.all.map { |u| ["#{u.description}", u.id] }
  end

  def employment_status_id_enum
    EmploymentStatus.all.map { |u| ["#{u.description}", u.id] }
  end

  def sex_id_enum
    Sex.all.map { |u| ["#{u.description}", u.id] }
  end

  def education_level_id_enum
    EducationLevel.all.map { |u| ["#{u.description}", u.id] }
  end
  # ends here for rails_admin

  private

  #generates a secure random key of 40 characters. Checks if
  #random key already exists
  def private_generate_token
    begin
      self.access_id = SecureRandom.base64(40)
    end while self.class.exists?(access_id: access_id)
  end

  def update_setting_table
    begin
      user = User.find(self.id)
      setting = user.setting
      if setting.nil?
        setting = Setting.new
        setting.save
        user.setting = setting
     end
    rescue StandardError => e
      logger.debug "update_setting_table exception: #{e.message}"
    end
  end

end
