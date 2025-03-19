class TableCellComponent < ViewComponent::Base
  def initialize(class_name: nil)
    @class_name = class_name
  end

  erb_template <<~'ERB'
    <td class="p-4 align-middle <%= @class_name %>">
      <%= content %>
    </td>
  ERB
end

class TableRowComponent < ViewComponent::Base
  renders_many :cells, TableCellComponent

  erb_template <<~'ERB'
    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
      <% cells.each do |cell| %>
        <%= cell %>
      <% end %>
    </tr>
  ERB
end

class TableHeadComponent < ViewComponent::Base
  def initialize(class_name: nil)
    @class_name = class_name
  end

  erb_template <<~'ERB'
    <th class="h-12 px-4 text-left align-middle font-medium <%= @class_name %>">
      <%= content %>
    </th>
  ERB
end

class TableHeaderComponent < ViewComponent::Base
  erb_template <<~'ERB'
    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
      <%= content %>
    </tr>
  ERB
end

class TableBodyComponent < ViewComponent::Base
  erb_template <<~'ERB'
    <tbody class="bg-white">
      <%= content %>
    </tbody>
  ERB
end

class TableComponent < ViewComponent::Base
  renders_many :heads, TableHeadComponent
  renders_many :rows, TableRowComponent

  erb_template <<~'ERB'
    <div class="relative w-full overflow-auto">
      <table class="w-full caption-bottom text-sm">
        <% if heads? %>
          <%= render TableHeaderComponent.new do %>
            <% heads.each do |head| %>
              <%= head %>
            <% end %>
          <% end %>
        <% end %>
        <%= render TableBodyComponent.new do %>
          <% rows.each do |row| %>
            <%= row %>
          <% end %>
        <% end %>
      </table>
    </div>
  ERB
end
