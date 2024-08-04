module ErrorHandlers
  class WordNotFoundHandler
    IMAGES = [
      "https://media3.giphy.com/media/jcxtvm2bsZDH2/giphy.gif?cid=9dc5af35ihl5cd6pce4v0z4e2yjj3rim9tyx0rka4b9u2443&ep=v1_gifs_gifId&rid=giphy.gif&ct=g",
      "https://media2.giphy.com/media/kcAz4pqDIN0Qg/giphy.gif?cid=9dc5af35i6d2glx1udcmc10vq7mntiko1wd9hjwvw78qteeu&ep=v1_gifs_gifId&rid=giphy.gif&ct=g",
      "https://media2.giphy.com/media/TRxJEmwadzj716ljDc/giphy.gif?cid=9dc5af35iougbiduw0tz4wukues9ltf30hqpjine1oxzlzc7&ep=v1_gifs_gifId&rid=giphy.gif&ct=g",
      "https://media4.giphy.com/media/SKrZfsPjGhRGu3Uxj0/giphy-downsized.gif?cid=9dc5af35ytcp9abpvyzq9qrv3w6w4wajpj831f3j4apq4tin&ep=v1_gifs_gifId&rid=giphy-downsized.gif&ct=g",
      "https://media2.giphy.com/media/1l7GT4n3CGTzW/giphy.gif?cid=9dc5af35mm6gno8jokpxprtv9mxvir63m32f10vuesmba9kt&ep=v1_gifs_gifId&rid=giphy.gif&ct=g"
    ].freeze

    def self.text
      I18n.t("errors.word_not_found")
    end

    def self.image
      IMAGES.sample
    end
  end
end
