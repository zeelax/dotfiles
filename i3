# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

### variables
#
# main modifier key
set $mod Mod4
# terminal emulator
set $term termite


### appearance
#
# fonts
#

    # Font for window titles. Will also be used by the bar unless a different font
    # is used in the bar {} block below.
    font pango:monospace 8

#
# colors
#
    # class                 border  backgr. text    indicator child border
    client.focused          #917944 #DEB968 #232B38 #DEB968   #917944
    client.focused_inactive #333333 #5F676A #232B38 #484E50   #5F676A
    client.unfocused        #333333 #222222 #888888 #292D2E   #222222
    client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
    client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

#
# gaps
#
    # no title bars for new windows
    for_window [class="^.*"] border pixel 1

    # gaps sizes
    gaps inner 4
    gaps outer 2

    # display borders only when there is more than one container in a workspace
    smart_borders no_gaps
    hide_edge_borders smart

#
# stuff
#
    # don't follow mouse cursor
    focus_follows_mouse no

#
# status bar
#
    # Start i3bar to display a workspace bar (plus the system information i3status
    # finds out, if available)
    bar {
            status_command i3blocks
            #font pango:DejaVu Sans Mono, Icons 10
            font pango:Terminus, Icons 8

        colors {
            focused_workspace  #917944 #DEB968 #232b38
            active_workspace   #333333 #222222 #E3C891
            inactive_workspace #333333 #222222 #888888
            urgent_workspace   #2F343A #900000 #FFFFFF
            binding_mode       #2F343A #900000 #FFFFFF
        }
    }


### key bindings
#
# basics
#
    # start a terminal
    bindsym $mod+Return exec $term

    # kill focused window
    bindsym $mod+Shift+q kill

    # start dmenu (a program launcher)
    bindsym $mod+d exec dmenu_run -sb '#DEB968' -sf '#222222'
    # There also is the (new) i3-dmenu-desktop which only displays applications
    # shipping a .desktop file. It is a wrapper around dmenu, so you need that
    # installed.
    # bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

    # Use Mouse+$mod to drag floating windows to their wanted position
    floating_modifier $mod

    # reload the configuration file
    bindsym $mod+Shift+c reload

    # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
    bindsym $mod+Shift+r restart

    # exit i3 (logs you out of your X session)
    bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

#
# moving around
#
    # change focus (UHK mode)
    bindsym $mod+j focus left
    bindsym $mod+k focus down
    bindsym $mod+i focus up
    bindsym $mod+l focus right

    # alternative layout for nano users (me)
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    # move focused window
    bindsym $mod+Shift+j move left
    bindsym $mod+Shift+k move down
    bindsym $mod+Shift+i move up
    bindsym $mod+Shift+l move right

    # alternatively, you can use the cursor keys:
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right

#
# layout stuff
#
    # split in horizontal orientation
    bindsym $mod+h split h

    # split in vertical orientation
    bindsym $mod+v split v

    # enter fullscreen mode for the focused container
    bindsym $mod+f fullscreen toggle

    # change container layout (stacked, tabbed, toggle split)
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # toggle tiling / floating
    bindsym $mod+Shift+space floating toggle

    # change focus between tiling / floating windows
    bindsym $mod+space focus mode_toggle
    bindsym $mod+Shift+s sticky toggle

    # focus the parent container
    bindsym $mod+a focus parent

    # focus the child container
    #bindsym $mod+d focus child

    # gaps
    bindsym $mod+y       gaps inner current minus 2
    bindsym $mod+u       gaps inner current plus 2
    bindsym $mod+Shift+y gaps outer current minus 2
    bindsym $mod+Shift+u gaps outer current plus 2


#
# workspaces
#
    # switch to workspace
    bindsym $mod+1 workspace 1
    bindsym $mod+2 workspace 2
    bindsym $mod+3 workspace 3
    bindsym $mod+4 workspace 4
    bindsym $mod+5 workspace 5
    bindsym $mod+6 workspace 6
    bindsym $mod+7 workspace 7
    bindsym $mod+8 workspace 8
    bindsym $mod+9 workspace 9
    bindsym $mod+0 workspace 10

    # move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace 1
    bindsym $mod+Shift+2 move container to workspace 2
    bindsym $mod+Shift+3 move container to workspace 3
    bindsym $mod+Shift+4 move container to workspace 4
    bindsym $mod+Shift+5 move container to workspace 5
    bindsym $mod+Shift+6 move container to workspace 6
    bindsym $mod+Shift+7 move container to workspace 7
    bindsym $mod+Shift+8 move container to workspace 8
    bindsym $mod+Shift+9 move container to workspace 9
    bindsym $mod+Shift+0 move container to workspace 10

    # switch workspaces on current output
    bindsym control+Mod1+Left workspace prev_on_output
    bindsym control+Mod1+Right workspace next_on_output

#
# resizing containers
#
    # resize window (you can also use the mouse for that)
    mode "resize" {
            # These bindings trigger as soon as you enter the resize mode

            # Pressing left will shrink the window’s width.
            # Pressing right will grow the window’s width.
            # Pressing up will shrink the window’s height.
            # Pressing down will grow the window’s height.
            bindsym j resize shrink width 10 px or 10 ppt
            bindsym k resize grow height 10 px or 10 ppt
            bindsym l resize shrink height 10 px or 10 ppt
            bindsym semicolon resize grow width 10 px or 10 ppt

            # same bindings, but for the arrow keys
            bindsym Left resize shrink width 10 px or 10 ppt
            bindsym Down resize grow height 10 px or 10 ppt
            bindsym Up resize shrink height 10 px or 10 ppt
            bindsym Right resize grow width 10 px or 10 ppt

            # back to normal: Enter or Escape
            bindsym Return mode "default"
            bindsym Escape mode "default"
    }

    bindsym $mod+r mode "resize"

#
# media keys
#
    # volume, +/- 5%
    bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && pkill -RTMIN+10 i3blocks
    bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && pkill -RTMIN+10 i3blocks

    # volume, +/- 1%
    bindsym shift+XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1% && pkill -RTMIN+10 i3blocks
    bindsym shift+XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1% && pkill -RTMIN+10 i3blocks

    # volume, (un-)mute
    bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && pkill -RTMIN+10 i3blocks

    # media player controls
    bindsym XF86AudioPlay exec --no-startup-id tizonia-remote pause
    bindsym XF86AudioPrev exec --no-startup-id tizonia-remote prev
    bindsym XF86AudioNext exec --no-startup-id tizonia-remote next


    #
    # internal screen brightness
    #
    # +/- 5%
    bindsym XF86MonBrightnessUp exec brightnessctl set +5% # increase screen brightness
    bindsym XF86MonBrightnessDown exec brightnessctl set 5%- # decrease screen brightness

    # +/- 1%
    bindsym shift+XF86MonBrightnessUp exec brightnessctl set +1% # increase screen brightness
    bindsym shift+XF86MonBrightnessDown exec brightnessctl set 1%- # decrease screen brightness


    #
    # external screen brightness
    #
    # +/- 5%
    bindsym control+XF86MonBrightnessUp exec brightnessctl -d ddcci5 set +5% # increase screen brightness
    bindsym control+XF86MonBrightnessDown exec brightnessctl -d ddcci5 set 5%- # decrease screen brightness

    # external keyboard mapping
    bindsym $mod+Prior exec brightnessctl -d ddcci5 set +5% # increase screen brightness
    bindsym $mod+Next exec brightnessctl -d ddcci5 set 5%- # decrease screen brightness

    # Redshift toggle
    bindsym $mod+XF86MonBrightnessUp exec killall -USR1 redshift

### Old stuff
# Lock screen
bindsym $mod+mod1+l exec --no-startup-id i3lock -c 000000

# NetworkManager dmenu
bindcode $mod+49 exec networkmanager_dmenu

# Dmenu calculator
bindsym $mod+equal exec /usr/local/bin/=


#
# Execute this on i3 startup
#
exec --no-startup-id xcalib ~/arch/05P7H-LQ133Z1\ \#1\ 2016-01-27\ 22-20\ D6500\ 2.2\ S\ XYZLUT+MTX.icc
#exec --no-startup-id compton -CGb
exec --no-startup-id dropbox
exec --no-startup-id redshift-gtk
exec --no-startup-id xset r rate 200 50
exec --no-startup-id ~/.fehbg
exec --no-startup-id xss-lock -l -- i3lock -c 000000
