class Workproject < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :title
  has_many :artifacts, dependent: :destroy
  validate :free_plan_can_only_have_one_workproject
  
  def free_plan_can_only_have_one_workproject
    if self.new_record? && (tenant.workprojects.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plan cannot have more than one project")
    end
  end
  
  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.workprojects
    else
      tenant.workprojects.order(:id).limit(1)
    end
  end
  
end
