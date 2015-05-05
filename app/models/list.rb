class List < ActiveRecord::Base
  has_many :tasks

  def self.unarchived
    where(archived: false)
  end

  def self.archived
    where(archived: true)
  end

  def incomplete_tasks
    tasks.where(status: 'incomplete')
  end

  def complete_tasks
    tasks.where(status: 'complete')
  end
end
