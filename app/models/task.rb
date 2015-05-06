class Task < ActiveRecord::Base
  belongs_to :list

  def complete?
    status == 'complete'
  end

  def update_status
    if complete?
      update(status: 'incomplete')
    else
      update(status: 'complete')
    end
  end
end
