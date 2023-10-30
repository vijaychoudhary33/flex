class Movie < ApplicationRecord
    has_one_attached :image, :dependent=> :destroy

    def image_url
        if image.attached?
          Rails.application.routes.url_helpers.rails_blob_path image.blob, host: :localhost
        else
          ''
        end
      end
end
