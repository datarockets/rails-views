module Rails
  class View < Cell::Concept
    include ::Cell::Slim
    include ::Cell::Builder
    # include ::Rails.application.routes.url_helpers
    include ::Rails::Views::ViewHelpers

    # include ActionView::Helpers
    include AbstractController::Helpers
    include ActionDispatch::Http::Cache::Request
    include ActionView::RecordIdentifier

    def show
      render 'show'
    end
  end
end
