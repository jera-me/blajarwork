class StoryPolicy < ApplicationPolicy

  def all?
    user.id = user.admin?
  end

  def edit?
    user.id = user.admin?
  end

  def new?
    user.id = user.admin?
  end

  def update?
    user.id = user.admin?
  end

  def destroy?
    user.id = user.admin?
  end

end
