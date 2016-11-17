class CategoryController < ApplicationController
  def sports
    @groups = Group.all
  end

  def food
    @groups = Group.all
  end

  def study
    @groups = Group.all
  end
end
