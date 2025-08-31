{ inputs, config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];

    # Define custom Fish functions
    functions = {
      # Custom prompt function
      fish_prompt = ''
        # Save the exit status of the last command
        set -l last_status $status

        # Define colors
        set -l normal (set_color normal)
        set -l user_color (set_color green)
        set -l host_color (set_color blue)
        set -l path_color (set_color cyan)
        set -l arrow_color (set_color yellow)
        set -l error_color (set_color red)

        # User and Host
        echo -n -s $user_color (whoami) $normal @ $host_color (prompt_hostname) $normal

        # Current Directory
        echo -n -s ":" $path_color (prompt_pwd) $normal

        # Git status (optional, requires git)
        # You can add more complex git integration here if desired
        # For a simple indicator, you could use something like:
        # set -l git_branch (git branch --show-current 2>/dev/null)
        # if test -n "$git_branch"
        #   echo -n -s " (" (set_color magenta) $git_branch (set_color normal) ")"
        # end

        # Newline for multi-line prompt (optional)
        # echo ""

        # Prompt character (arrow, or red arrow if last command failed)
        if test $last_status -eq 0
          echo -n -s " " $arrow_color "❯" $normal " "
        else
          echo -n -s " " $error_color "❯" $normal " "
        end
      '';
    };

    # You can also add shellInit for other configurations if needed
    # shellInit = ''
    #   # Other fish configurations
    # '';
  };
}