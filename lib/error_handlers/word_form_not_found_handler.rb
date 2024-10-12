module ErrorHandlers
  class WordFormNotFoundHandler
    def self.text
      I18n.t("errors.word_form_not_found")
    end
  end
end
