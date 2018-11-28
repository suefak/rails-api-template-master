# frozen_string_literal: true

class ExamplesController < OpenReadController
  before_action :set_example, only: %i[update destroy] #running a method 'set_example'before destroy

  # GET /examples
  # GET /examples.json
  def index
    @examples = Example.all
    # if we wanted to limit current_user's examopls
    # inherit from protectedcontroller
    # cureent_user.example

    render json: @examples
  end

  # GET /examples/1
  # GET /examples/1.json
  def show
    render json: Example.find(params[:id])
  end

  # POST /examples
  # POST /examples.json
  # token looks up current_user to build resource
  def create
    @example = current_user.examples.build(example_params)
    # => example with user_id automatically filled in

    if @example.save
      render json: @example, status: :created
    else
      render json: @example.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /examples/1
  # PATCH/PUT /examples/1.json
  def update
    if @example.update(example_params)
      render json: @example
    else
      render json: @example.errors, status: :unprocessable_entity
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.json
  def destroy
    @example.destroy

    head :no_content
  end

  def set_example
    # only look up examples that belong to current user
    @example = current_user.examples.find(params[:id])
  end

  def example_params
    params.require(:example).permit(:text)
  end

  private :set_example, :example_params
end