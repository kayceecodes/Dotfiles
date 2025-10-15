# List of Files
1.(access through dconf gui editor only) - mykeybindings.conf
2. ~/scripts/
3. ~/.bashrc
4. ~/.tmux/ (this is the default folder created after installing tmux)
5. ~/.tmux.conf (this is user created file for customizing tmux)
6. /usr/share/cinnamon/js/ui/windowManager.js
7. ~/.config/powerline-go/gruvbox-ai-gen1.json
8. ~/.themes/Gruvbox-Dark-Custom/ 

#Directions
- Example title - Edit made file if there was one
/path/to/file/or/directory
Notes:

- Workspace Animation Edit - Command: 'sudo sed -i -E 's/(WORKSPACE_ANIMATION_TIME = )([0-9]+\.[0-9]+)/\10.0/' /usr/share/cinnamon/js/ui/windowManager.js'
/usr/share/cinnamon/js/ui/windowManager.js

- Keyboard Bindings - Command: dconf dump /org/cinnamon/desktop/keybindings/ > ~/mykeybindings.conf
/org/cinnamon/desktop/keybindings/dconf-settings.conf
Notes: /org/cinnamon/desktop is not a physical file path but a GSettings schema name used to store configuration settings for the Cinnamon desktop environment. You canaccess and manage these settings using commands like gsettings or by installing and using the dconf-editor GUI.

- Kitty directory & its following files: 'Adapta Nokto Maia.conf'   current-theme.conf   kitty.conf   kitty.conf.bak  'Monokai Soda.conf'
~/.config/kitty/
