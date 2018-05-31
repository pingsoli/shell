function fish_prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

  echo -n (prompt_pwd)

  if test -n "$git_branch"
    set_color blue;   echo -n "("; set_color normal;
    set_color yellow; echo -n $git_branch; set_color normal;
    set_color blue;   echo -n ")"; set_color normal;
  end

  echo -n " \$ "
end
