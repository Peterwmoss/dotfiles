from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "st"

keys = [
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    Key([mod], 'period', lazy.next_screen(), desc='Next monitor'),
    Key([mod], 'comma', lazy.prev_screen(), desc='Prev monitor'),

    Key([mod], "j", lazy.group.next_window(), desc="Next window"),
    Key([mod], "k", lazy.group.prev_window(), desc="Previous window"),

    Key([mod], "h", lazy.layout.grow_left(), desc="Grow left"),
    Key([mod], "l", lazy.layout.grow_right(), desc="Grow right"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod], "e", lazy.spawn("rofi -show emoji"), desc="Emoji"),

    Key(
        [mod], "a",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    # Qtile stuff
    Key([mod], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "e", lazy.shutdown(), desc="Shutdown Qtile"),

    # Run programs
    Key([mod], "d", lazy.spawn(
        "rofi -show drun -show-icons -font \"hack 10\""), desc="Launch rofi"),

    Key([mod, "shift"], "d", lazy.spawn(
        "rofi -show run -font \"hack 10\""), desc="Launch rofi"),

    # System menu - poweroff, reboot etc.
    Key([mod], "p", lazy.spawn(
        "/home/peter/.local/scripts/sysmenu"), desc="System menu"),

    # Screenshot
    Key([mod], "s", lazy.spawn(
        "flameshot gui -p /home/peter/pictures/screenshots"), desc="Screenshot"),

    Key([mod, "shift"], "Space",
        lazy.window.toggle_floating(), desc="Toggle floating"),

    Key([mod, "shift"], "l", lazy.spawn(
        'i3lock-fancy-multimonitor -b=0x8'), desc="Lock screen"),

    Key([mod], "f3", lazy.spawn('doas -- rogauracore brightness 1'),
        desc="Keyboard brightness up"),
    Key([mod], "f2", lazy.spawn('doas -- rogauracore brightness 0'),
        desc="Keyboard brightness down"),

    Key([mod], "b", lazy.spawn('doas -- light -A 10'),
        desc="Screen brightness up"),
    Key([mod, "shift"], "b", lazy.spawn(
        'doas -- light -U 10'), desc="Screen brightness down"),

    # Volume control
    Key([mod], "u", lazy.spawn("pactl set-sink-volume 0 +5%"), desc="Volume up"),
    Key([mod, "shift"], "u", lazy.spawn(
        "pactl set-sink-volume 0 -5%"), desc="Volume down"),

    Key([mod], "y", lazy.spawn("pulsemixer --toggle-mute"), desc="Toggle mute"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )

colors = []
cache = '/home/peter/.cache/wal/colors'


def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()


load_colors(cache)

layouts = [
    layout.Columns(
        border_focus=colors[4],
        border_width=2,
        border_on_single=True,
        margin=6,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Hack Nerd Font Mono",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

widgets = [
    widget.CurrentLayoutIcon(
        foreground=colors[7],
        padding=0,
        scale=0.5,
    ),
    widget.Spacer(),
    widget.Bluetooth(
        hci="/dev_F0_B6_1E_7E_05_35",
    ),
    widget.Sep(
        foreground=colors[7],
        linewith=2,
    ),
    widget.Backlight(
        update_interval=1,
        backlight_name="intel_backlight",
        format="  {percent:2.0%} "
    ),
    widget.Sep(
        foreground=colors[7],
        linewith=2,
    ),
    widget.Memory(
        format="{MemUsed: .1f}{mm} /{MemTotal: .1f}{mm} ",
        measure_mem="G"
    ),
    widget.Sep(
        foreground=colors[7],
        linewith=2,
    ),
    widget.BatteryIcon(
        theme_path="/home/peter/.config/qtile/battery-icons",
        scale=1,
        update_interval=10,
    ),
    widget.Battery(
        format="{percent:2.0%} ({hour:d}:{min:02d} left) - {watt:.2f}W ",
        update_interval=10,
    ),
    widget.Sep(
        foreground=colors[7],
        linewith=2,
    ),
    widget.TextBox(
        text="  ",
        fontsize=14,
        padding=0,
    ),
    widget.PulseVolume(
        get_volume_command="pamixer --get-volume-human",
        limit_max_volume=True,
        update_interval=0.1,
    ),
    widget.TextBox(
        text=" ",
        fontsize=14,
        padding=0,
    ),
    widget.Sep(
        foreground=colors[7],
        linewith=2,
    ),
    widget.Clock(
        format="%d-%m-%Y - %a %H:%M:%S",
    ),
    widget.Spacer(length=3),

]


def myBar():
    return bar.Bar(
        [
            widget.Spacer(length=3),
            widget.GroupBox(
                fontsize=12,
                borderwidth=3,
                highlight_method='block',
                active=colors[7],
                inactive=colors[3],
                block_highlight_text_color=colors[0],
                highlight_color=colors[1],
                this_current_screen_border=colors[4],
                this_screen_border=colors[4],
                other_current_screen_border=colors[5],
                other_screen_border=colors[5],
                urgent_border=colors[2],
                rounded=True,
                disable_drag=True,
            ),
        ] +
        widgets,
        24,
        margin=[6, 6, 0, 6],
        background=colors[0],
    )


screens = [
    Screen(top=myBar()),
    Screen(top=myBar()),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus=colors[4],
    border_width=2,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
