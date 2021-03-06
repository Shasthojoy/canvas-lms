#
# Copyright (C) 2018 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require 'pact/consumer/rspec'

Pact.configure do |config|
  config.diff_formatter = :list
  config.logger.level = Logger::DEBUG
  config.pactfile_write_mode = :overwrite
  config.pactfile_write_order = :chronological
end

Pact.service_consumer 'Consumer' do
  has_pact_with 'CanvasAPI' do
    mock_service :canvas_api do
      port 1234
      pact_specification_version '2.0.0'
    end
  end
end
