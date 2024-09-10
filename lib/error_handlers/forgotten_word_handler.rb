module ErrorHandlers
  class ForgottenWordHandler
    def self.text
      I18n.t("errors.forgotten_word")
    end
  end
end
