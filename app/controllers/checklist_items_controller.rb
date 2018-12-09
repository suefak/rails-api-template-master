class ChecklistItemsController < ProtectedController
  before_action :set_checklist_item, only: %i[show update destroy]

  # GET /checklist_items
  def index
    @checklist_items = current_user.checklist_items.all

    render json: @checklist_items
  end

  # GET /checklist_items/1
  def show
    render json: @checklist_item
  end

  # POST /checklist_items
  def create
    @checklist_item = current_user.checklist_items.build(checklist_item_params)

    if @checklist_item.save
      render json: @checklist_item, status: :created, location: @checklist_item
    else
      render json: @checklist_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checklist_items/1
  def update
    if @checklist_item.update(checklist_item_params)
      render json: @checklist_item
    else
      render json: @checklist_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checklist_items/1
  def destroy
    @checklist_item.destroy


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_item
      @checklist_item = current_user.checklist_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checklist_item_params
      params.require(:checklist_item).permit(:priority, :text, :finished, :user_id)
    end
end
