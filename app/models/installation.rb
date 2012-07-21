class Installation < ActiveRecord::Base
 
  acts_as_commentable   
  
  attr_accessible :id, :multichoice_number, :financial_number, :installation_number, :installation_type_id, :client_number, :client_id,
                  :cost_total, :selling_total, :voucher_number,  
                  :decoder_number_one, :decoder_number_two,
                  :smartcard_number_one, :smartcard_number_two,
                  :lnb_no, :lnb_type_id, :installer_ids, :installation_at,
                  :updated_at, :created_at, :installation_items_attributes
 
  validates :installation_number, :presence => true,
                                  :uniqueness => true, :on => :create
  validates :client_number, :presence => true
  validates :decoder_number_one, :presence => true
  validates :smartcard_number_one, :presence => true
                  
  belongs_to :client, :primary_key => :client_number , :foreign_key => :client_number   
  belongs_to :installation_type
  belongs_to :lnb_type          
                  
  has_many :installation_items, :dependent => :destroy    
  has_and_belongs_to_many :installers
  
  accepts_nested_attributes_for :installation_items, :allow_destroy => true
             
  before_create :generate_installation_number

  searchable do
    text :installation_number, :boost => 5
    text :client do 
      client.name 
    end
    integer :financial_number
  end
  
  def self.search(search,type)
    if search
      where('installation_number LIKE ? OR client_id LIKE ? ', "%#{search}%","%#{search}%")                                
    else
      scoped
    end        
  end
  
  def self.count_on(date)
    where("date(created_at) = ?",date).count(:id)
  end

  def self.installations_by_month(month)

    installations = Installation.select("installation_types.title, COUNT(*) as total").joins("LEFT JOIN installation_types ON installations.installation_type_id = installation_types.id").where("date(installations.created_at) >= ?", month).where("date(installations.created_at) < ?", month + 1.month).group("installation_type_id").all

    total = 0

    installation_data = Array.new
    installation_types = Array.new

    installations.each do |value|
      installation_data << value['total']
      installation_types << value['title']
      total += value['total'].to_i()
    end
    
    drilldown_data = "name: '" + month.to_s() + "'" +
                    ", categories: [" + installation_types.map{ |i|  %Q('#{i}') }.join(',') + "] " +
                    ", data: [" + installation_data.map{ |i|  %Q(#{i}) }.join(',') + "] "
                    ", color: colors[0]"
    
    data = '{ y: ' + total.to_s() + ', color: colors[0], drilldown: {' + drilldown_data.to_s() + ', color: colors[0]} }'

  end

  def generate_installation_number
    record = true
    while record
      random = "I#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["installation_number = ?", random])
    end
    self.installation_number = random if self.installation_number.blank?
    self.installation_number
  end  
   
end