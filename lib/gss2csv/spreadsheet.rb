require 'yaml'

module Gss2csv
  module Spreadsheet
    # FIXME: 一時的にここに置いている
    SETTINGS_FILE_PATH = '/tmp/gss2csv_settings.yml'.freeze
    SHEET_ID = YAML.load_file(SETTINGS_FILE_PATH).fetch('sheet_id')

    def spreadsheet(google_drive_session, sheet_id = SHEET_ID)
      google_drive_session.spreadsheet_by_key(sheet_id)
    end

    def worksheet_by_name(name, spreadsheet)
      spreadsheet.worksheets.find { |ws| ws.title == name }
    end

    module_function :spreadsheet, :worksheet_by_name
  end
end
