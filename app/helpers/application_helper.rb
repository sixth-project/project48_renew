# frozen_string_literal: true

module ApplicationHelper

  def full_title(page_title='') #ページのタイトルがない場合は"Project48"を表示する
    base_title = "Project48"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
