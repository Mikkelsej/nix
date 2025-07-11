{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/conf/keybindings.conf".text = ''
# -----------------------------------------------------
# Key bindings
# name: "Default"
# -----------------------------------------------------

$SCRIPTS = ~/.config/hypr/scripts/

# SUPER KEY
$mainMod = SUPER



# Applications
bind = $mainMod, RETURN, exec, $terminal    # Open the terminal
bind = $mainMod, B, exec, $browser          # Open the browser
bind = $mainMod, F, exec, $filemanager      # Open the filemanager
bind = $mainMod CTRL, E, exec, ~/.config/ml4w/settings/emojipicker.sh # Open the emoji picker
bind = $mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh  # Open the calculator
bind = $mainMod, space, exec, rofi -show drun # Open app search with rofi
bind = $mainMod, C, exec, code # Open VS Code
bind = $mainMod, O, exec, obsidian # Open Obsidian
bind = $mainMod, S, exec, spotify # Open Spotify
bind = $mainMod, D, exec, discord # Open Discord
bind = $mainMod, I, exec, intellij-idea-ultimate-edition # Open Intellij IDEA Ultimate
# Windows
bind = $mainMod, Q, killactive                                                              # Kill active window
bind = $mainMod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill # Quit active window and all open instances
bind = $mainMod, E, fullscreen, 0                                                           # Set active window to fullscreen
bind = $mainMod, M, fullscreen, 1                                                           # Maximize Window
bind = $mainMod, T, togglefloating                                                          # Toggle active windows into floating mode
bind = $mainMod SHIFT, T, workspaceopt, allfloat                                            # Toggle all windows into floating mode
bind = $mainMod, J, togglesplit                                                             # Toggle split
bind = $mainMod, left, movefocus, l                                                         # Move focus left
bind = $mainMod, right, movefocus, r                                                        # Move focus right
bind = $mainMod, up, movefocus, u                                                           # Move focus up
bind = $mainMod, down, movefocus, d                                                         # Move focus down
bindm = $mainMod, mouse:272, movewindow                                                     # Move window with the mouse
bindm = $mainMod, mouse:273, resizewindow                                                   # Resize window with the mouse
bind = $mainMod SHIFT, right, resizeactive, 100 0                                           # Increase window width with keyboard
bind = $mainMod SHIFT, left, resizeactive, -100 0                                           # Reduce window width with keyboard
bind = $mainMod SHIFT, down, resizeactive, 0 100                                            # Increase window height with keyboard
bind = $mainMod SHIFT, up, resizeactive, 0 -100                                             # Reduce window height with keyboard
bind = $mainMod, G, togglegroup                                                             # Toggle window group
bind = $mainMod, K, swapsplit                                                               # Swapsplit

# Actions
bind = $mainMod CTRL, R, exec, hyprctl reload                                               # Reload Hyprland configuration
bind = $mainMod, PRINT, exec, $SCRIPTS/screenshot.sh                                        # Take a screenshot
bind = $mainMod SHIFT, S, exec, $SCRIPTS/screenshot.sh                                      # Take a screenshot
bind = $mainMod CTRL, W, exec, waypaper --folder ~/nix/wallpapers                           # Open wallpaper selector
bind = $mainMod CTRL, RETURN, exec, pkill rofi || rofi -show drun -replace -i               # Open application launcher


# Workspaces
bind = $mainMod, 1, workspace, 1  # Open workspace 1
bind = $mainMod, 2, workspace, 2  # Open workspace 2
bind = $mainMod, 3, workspace, 3  # Open workspace 3
bind = $mainMod, 4, workspace, 4  # Open workspace 4
bind = $mainMod, 5, workspace, 5  # Open workspace 5
bind = $mainMod, 6, workspace, 6  # Open workspace 6
bind = $mainMod, 7, workspace, 7  # Open workspace 7
bind = $mainMod, 8, workspace, 8  # Open workspace 8
bind = $mainMod, 9, workspace, 9  # Open workspace 9
bind = $mainMod, 0, workspace, 10 # Open workspace 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1  # Move active window to workspace 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2  # Move active window to workspace 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3  # Move active window to workspace 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4  # Move active window to workspace 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5  # Move active window to workspace 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6  # Move active window to workspace 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7  # Move active window to workspace 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8  # Move active window to workspace 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9  # Move active window to workspace 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10 # Move active window to workspace 10

bind = $mainMod, Tab, workspace, m+1       # Open next workspace
bind = $mainMod SHIFT, Tab, workspace, m-1 # Open previous workspace


bind = $mainMod, mouse_down, workspace, e+1  # Open next workspace
bind = $mainMod, mouse_up, workspace, e-1    # Open previous workspace
bind = $mainMod CTRL, down, workspace, empty # Open the next empty workspace


# Fn keys

# Increase brightness by 10%
bind = , XF86MonBrightnessUp, exec, swayosd-client --brightness raise

# Reduce brightness by 10%
bind = , XF86MonBrightnessDown, exec, swayosd-client --brightness lower  


# Increase volume by 5%
bind = , XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise

# Reduce volume by 5% 
bind = , XF86AudioLowerVolume, exec, swayosd-client --output-volume lower     


# Toggle Volume output
bind = , XF86AudioMute, exec, swayosd-client --output-volume mute-toggle                                                                                 


# Audio play pause
bind = , XF86AudioPlay, exec, playerctl play-pause


# Audio pause
bind = , XF86AudioPause, exec, playerctl pause


# Audio next
bind = , XF86AudioNext, exec, playerctl next


# Audio previous
bind = , XF86AudioPrev, exec, playerctl previous


# Toggle microphone
bind = , XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle


# Open screenlock
bind = , XF86Lock, exec, notify-send h

# Caps lock notification (Sleep to make hyprland happy, since its a toggle)
bind = , CAPS_LOCK, exec, bash -c 'sleep 0.1 && swayosd-client --caps-lock'

# Num Lock notification (Sleep to make hyprland happy, since its a toggle)
bind = , NUM_LOCK, exec, bash -c 'sleep 0.1 && swayosd-client --num-lock'

  '';
}