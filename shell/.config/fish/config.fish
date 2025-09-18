set fish_greeting
source $__fish_config_dir/env.fish

function show_todos
  set todo_file ~/.local/share/nvim/dooing_todos.json
  if test -s $todo_file
    
    set -l TAB (printf "\t")
    {
      # header: todos: (left column), task, est
      printf "%s\t%s\t%s\n" "  Todos:" "task" "est"
      # rows: empty left col, task, est
      jq -r '
        .[] |
        (.text // "-") as $text |
        (.estimated_hours // "-") as $est |
        ( if $est == "-" then "-" 
          elif ($est|type == "number") then
            if ($est % 24 == 0) then (($est/24|floor|tostring) + "d") else ($est|tostring + "h") end
          else ($est|tostring) end
        ) as $eststr |
        ["", $text, $eststr] | @tsv
      ' "$todo_file"
    } | column -ts "$TAB"
  end
end

if status is-interactive
  show_todos
end