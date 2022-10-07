require 'yaml'

module Gss2csv
  module Worksheet
    # FIXME: 一時的にここに置いている
    SETTINGS_FILE_PATH = '/tmp/gss2csv_settings.yml'.freeze

    def gss_to_hash(worksheet)
      hash_key_style = YAML.load_file(SETTINGS_FILE_PATH).fetch('hash_key_style')
      headers = headers(hash_key_style)

      desired_hashes(worksheet, headers)
    end

    # TODO: ヘッダに空文字が含まれていた場合はどうするか
    def headers(worksheet, hash_key_style = 'symbol')
      if hash_key_style == 'string'
        (1..worksheet.num_cols).map { |col| worksheet[1, col] }
      else
        (1..worksheet.num_cols).map { |col| worksheet[1, col].to_sym }
      end
    end

    def required_column_numbers(worksheet)
      required_column_names = YAML.load_file(SETTINGS_FILE_PATH).fetch('required_column_names')
      required_column_numbers = []

      (1..worksheet.num_cols).each do |col_number|
        column_name = worksheet[1, col_number]

        required_column_numbers << col_number if required_column_names.include?(column_name)
      end

      required_column_numbers
    end

    # hash_keys はシンボルまたは文字列
    # FIXME: desired_hashes という命名は変更する
    def desired_hashes(worksheet, hash_keys)
      desired_hashes = []

      (2..worksheet.num_rows).each do |row_number|
        inserted_hash = {}
        is_skip_row = false

        (1..worksheet.num_cols).each do |col_number|
          # 添字は0から始まるが、列数は1から始まるため、1をマイナスする
          key = hash_keys[col_number - 1]
          value = worksheet[row_number, col_number]

          if skip_row?(worksheet, value, col_number)
            is_skip_row = true

            break
          end

          inserted_hash[key] = value
        end

        desired_hashes << inserted_hash unless is_skip_row
      end

      desired_hashes
    end

    def skip_row?(worksheet, value, col_number)
      required_column_numbers = required_column_numbers(worksheet)

      required_column_numbers.include?(col_number) && value.empty?
    end

    module_function :gss_to_hash,
                    :headers,
                    :required_column_numbers,
                    :desired_hashes,
                    :skip_row?
  end
end
