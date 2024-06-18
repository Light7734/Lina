import XMonad

import XMonad.Actions.SpawnOn
import XMonad.Actions.CycleWS
import XMonad.Actions.WorkspaceNames

import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Util.NamedWindows (getName)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

import Control.Monad (forM_, join)

import Data.List (sortBy)
import Data.Function (on)

my_startup_hook :: X()

my_startup_hook = do
                spawnOnce "feh --bg-fill ~/pictures/wallpapers/gruvbox/gruvbox_minimalistic_01"
                spawnOnce "/home/light/.config/xmonad/toggle_picom.sh"
                spawnOnce "setxkbmap -model pc104 -layout us,ir -variant , -option grp:rwin_toggle"
                spawnOnce "mpv --no-video --no-terminal ~/.config/xmonad/welcome.wav"

main :: IO ()
main = xmonad $ ewmh $  my_conf

my_conf 
    = def
    {

    layoutHook = spacingWithEdge 16 $ my_layout
    , startupHook = my_startup_hook
    , manageHook = manageDocks <+> manageSpawn <+> manageHook def
    , focusedBorderColor = "#fe8019"
    , normalBorderColor  = "#928374"
    }
    `additionalKeysP`
    [ ("M-<Tab>", toggleWS)

    , ("M-k", spawn "kitty")


    , ("M-`", spawn "rofi -show run")
    , ("M-c", spawn "rofi -show calc -modi calc -no-show-match -no-sort")

    , ("M-s", spawn "flameshot gui")
    , ("M-w", spawn "feh --bg-fill --randomize ~/pictures/wallpapers/gruvbox")
    , ("M-p", spawn "~/.config/xmonad/toggle_picom.sh &> /dev/null &")
    , ("M-\\", spawn "rofi -show Search -modes 'Search:/home/light/.config/xmonad/duck_search.sh'")
    , ("M-|", spawn "killall matching_engine -9 ; killall risk_engine_cpp -9")

    , ("<XF86AudioMute>", spawn "amixer -q -D pulse sset Master toggle")
    , ("<XF86AudioLowerVolume>", spawn "amixer -q -D pulse sset Master on ; amixer -q -D pulse sset Master 2%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q -D pulse sset Master on ; amixer -q -D pulse sset Master 2%+")
    , ("<XF86AudioNext>", spawn "echo 'playlist-next weak' | socat - '/tmp/mpvsocket'")
    , ("<XF86AudioPrev>", spawn "echo 'playlist-prev weak' | socat - '/tmp/mpvsocket'")
    , ("<XF86AudioPlay>", spawn "echo 'cycle pause' | socat - '/tmp/mpvsocket'")
    ]

my_layout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        threeCol = ThreeColMid nmaster delta ratio
        tiled = Tall nmaster delta ratio
        nmaster = 1 -- Default number of windows in the master pane
        ratio = 1/2 -- Default propoetion of screen occupied by master pane
        delta = 3/100 -- Percent of screen to increment when resizing panes
