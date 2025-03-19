class PhlexCablesTable < Phlex::HTML
  def initialize(cables:)
    @cables = cables
  end

  def view_template
    render PhlexUI::Table.new do
      render PhlexUI::Table::Header.new do
        render PhlexUI::Table::Row.new do
          render PhlexUI::Table::Head.new { "Name" }
          render PhlexUI::Table::Head.new(class_name: "text-right") { "Status" }
        end
      end
      render PhlexUI::Table::Body.new do
        @cables.each do |cable|
          render PhlexUI::Table::Row.new do
            render PhlexUI::Table::Cell.new(class_name: "font-medium") do
              a(href: Rails.application.routes.url_helpers.cable_path(cable.id), class: "hover:text-primary") { cable.name }
            end
            render PhlexUI::Table::Cell.new(class_name: "text-right") do
              span(class: "cable-#{cable.status}") { cable.status }
            end
          end
        end
      end
    end
  end
end

module PhlexUI
  class Table < Phlex::HTML
    def view_template(&block)
      div(class: "relative w-full overflow-auto") do
        table(class: "w-full caption-bottom text-sm", &block)
      end
    end
  end

  class Table::Header < Phlex::HTML
    def view_template(&block)
      thead(class: "border-b bg-white", &block)
    end
  end

  class Table::Row < Phlex::HTML
    def view_template(&block)
      tr(class: "border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted", &block)
    end
  end

  class Table::Head < Phlex::HTML
    def initialize(class_name: nil)
      @class = class_name
    end

    def view_template(&block)
      th(class: "h-12 px-4 text-left align-middle font-medium #{@class}", &block)
    end
  end

  class Table::Body < Phlex::HTML
    def view_template(&block)
      tbody(class: "bg-white", &block)
    end
  end

  class Table::Cell < Phlex::HTML
    def initialize(class_name: nil)
      @class = class_name
    end

    def view_template(&block)
      td(class: "p-4 align-middle #{@class}", &block)
    end
  end
end
