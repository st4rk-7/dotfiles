function renwall --description "Rename image files in the current directory to wallpaper_NNN.ext format"
    # Create a temporary directory to avoid name collisions during renaming.
    set -l temp_dir (mktemp -d)

    # Ensure the temporary directory is removed on exit, even if there's an error.
    trap "rm -rf '$temp_dir'" EXIT

    # 1. Move all target files to the temporary directory to prevent overwrites.
    for file in *.{png,jpg,jpeg,gif,bmp}
        # Check if the file exists and is a regular file before moving
        if test -f "$file"
            mv -- "$file" "$temp_dir/"
        end
    end

    # 2. Rename files from the temporary directory back to the current directory.
    set -l i 1
    for file in "$temp_dir"/*
        set -l ext (path extension "$file")
        set -l new_name (printf "wallpaper_%03d.%s" $i $ext)
        mv -- "$file" "$new_name"
        set i (math $i + 1)
    end
end