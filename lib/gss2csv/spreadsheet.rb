require 'yaml'

module Gss2csv
  module Spreadsheet
    # FIXME: 一時的に /tmp に置いている
    SETTINGS_FILE_PATH = '/tmp/gss2csv_settings.yml'.freeze

    # FIXME: 対症療法
    def sheet_id
      settings_file_path = if File.exist?(SETTINGS_FILE_PATH)
                             SETTINGS_FILE_PATH
                           else
                             'gss2csv_settings_sample.yml'
                           end

      YAML.load_file(settings_file_path).fetch('spreadsheet_id')
    end

    def spreadsheet(google_drive_session, spreadsheet_id)
      google_drive_session.spreadsheet_by_key(spreadsheet_id)
    end

    def worksheet_by_name(name, spreadsheet)
      spreadsheet.worksheets.find { |ws| ws.title == name }
    end

    module_function :spreadsheet, :worksheet_by_name
  end
end
