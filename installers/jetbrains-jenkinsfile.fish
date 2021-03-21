function jetbrains-jenkinsfile --description "Install jenkinsfile support to all installed JetBrains IDEs"
    set -l IDE_DIRS ~/.config/JetBrains/*

    for ide_dir in $IDE_DIRS
        set -l conf_dir "$ide_dir/filetypes"
        # Create configuration sub-directory if it doesn't exist yet
        if not test -d $conf_dir
            mkdir $conf_dir
        end
        # Download the relevant configuration file it it doesn't exist
        set -l conf_file "$conf_dir/Jenkinsfile.xml"
        if not test -e $conf_file
            wget -q -O "$conf_file" https://raw.githubusercontent.com/crucio55/pycharm-jenkinsfile/master/Jenkinsfile.xml
        end
    end
end