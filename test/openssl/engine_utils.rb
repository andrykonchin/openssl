module EngineUtils
  def get_engine
    OpenSSL::Engine.by_id("openssl")
  end

  def crypt_data(data, key, mode)
    cipher = yield
    cipher.send mode
    cipher.key = key
    cipher.update(data) + cipher.final
  end
end
