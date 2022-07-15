module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # Обрабатывать ошибку ActiveRecord::RecordNotFound в методе notfound
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound
      # logger.warn exception
      redirect_to root_path
      flash[:danger] = 'Страница не найдена.'
    end
  end
end
