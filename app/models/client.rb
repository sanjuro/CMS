class Client < ActiveRecord::Base
  
  attr_accessible :client_number, :client_type, :title, :intials, :name, :surname, :id_number,
                  :is_smp, :smp_no, :smp_rep_code,
                  :fax, :telephone_home, :mobile_number_one, :mobile_number_two, :email_address,
                  :unit_number, :street_name, :suburb, :city,
                  :province, :postal_code, :latitude, :longitude,
                  :created_at, :updated_at
                  
  validates :registered_name,  :presence => true, 
                               :length => {
                                  :minimum   => 3,
                                  :maximum   => 20,
                                  :too_short => "must have at least %{count} characters",
                                  :too_long  => "must have at most %{count} characters"
                                }              
  
  has_many :installations, :dependent => :destroy
  
  before_create :generate_client_number
  
  def generate_client_number
    record = true
    while record
      random = "C#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["client_number = ?", random])
    end
    self.client_number = random if self.client_number.blank?
    self.client_number
  end
  
end