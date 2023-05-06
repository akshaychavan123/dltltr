class Papa < ApplicationRecord
    has_one_attached :image
    # mount_uploader :images, AttachmentUploader

end
