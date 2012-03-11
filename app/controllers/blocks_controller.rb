class BlocksController < ApplicationController
  def create
    block = Block.create!(params[:block])
    render text: block.id
  end
end
