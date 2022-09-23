require_relative 'gss2csv/version'

module Gss2csv
  class Error < StandardError; end

  def self.debug
    # gs = GoogleSpreadsheet.new
    # ss = gs.spreadsheet
    # sheets = ss.worksheets
    # gs.apps_sheet
  end

  def self.greet(name)
    "Hello, #{name}!"
  end
end
