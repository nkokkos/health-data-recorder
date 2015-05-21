class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :measurement_blocks
  has_many :measurements, through: :measurement_blocks

  has_and_belongs_to_many :chronic_diseases, join_table: :chronic_diseases_users

  has_many :patient_relationships
  has_many :patients, :through => :patient_relationships

  validates :height, :allow_nil => false, numericality: { only_integer: true }

  before_create :generate_access_token

  def generate_access_token
    #call private nethod below
    private_generate_token
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


end
