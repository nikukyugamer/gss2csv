require 'yaml'
require 'json'
require 'google_drive'

module Gss2csv
  module Auth
    # FIXME: 一時的に /tmp に置いているが YAML で指定できるようにしたい
    CREDENTIALS_FILE_PATH = '/tmp/credentials.json'.freeze

    def session(credential_file_path: CREDENTIALS_FILE_PATH)
      options = JSON.parse(
        File.read(credential_file_path)
      )

      key = OpenSSL::PKey::RSA.new(options['private_key'])
      auth = Signet::OAuth2::Client.new(
        token_credential_uri: options['token_uri'],
        audience: options['token_uri'],
        scope: %w[
          https://www.googleapis.com/auth/drive
          https://docs.google.com/feeds/
          https://docs.googleusercontent.com/
          https://spreadsheets.google.com/feeds/
        ],
        issuer: options['client_email'],
        signing_key: key
      )

      auth.fetch_access_token!

      GoogleDrive.login_with_oauth(auth.access_token)
    end

    module_function :session
  end
end
