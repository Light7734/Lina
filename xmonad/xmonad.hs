import XMonad

import XMonad.Actions.SpawnOn
import XMonad.Actions.CycleWS
import XMonad.Actions.WorkspaceNames

import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab
import XMonad.Util.EZConfig
import XMonad.Util.NamedWindows (getName)
import qualified XMonad.StackSet as W

import Control.Monad (forM_, join)

import Data.List (sortBy)
import Data.Function (on)

my_startup_hook :: X()

my_startup_hook = do
                spawnOnOnce "4\62057" "librewolf"
                spawnOnOnce "6\61441" "kitty /home/light/music/"
                spawnOnOnce "3\61948" "kitty /home/light/art"
                spawnOnOnce "2\59285" "kitty /home/light/dev/"
                spawnOnOnce "1\59285" "kitty /home/light/"
                spawnOnce "/home/light/.config/xmonad/toggle_picom.sh"
                spawnOnce "/home/light/.config/xmonad/toggle_polybar.sh"
                spawnOnce "feh --bg-fill --randomize ~/pictures/wallpapers"
                spawnOnce "setxkbmap -model pc104 -layout us,ir -variant , -option grp:rwin_toggle"
                spawnOnce "mpv --no-video --no-terminal ~/.config/xmonad/welcome.wav"

main :: IO ()
main = xmonad $ ewmh $ xmobarProp $ my_conf

my_conf 
    = def
    { modMask = mod4Mask
    , layoutHook = spacingWithEdge 16 $ my_layout
    , startupHook = my_startup_hook
    , manageHook = manageDocks <+> manageSpawn <+> manageHook def
    , logHook = workspaceHistoryHook <+> polybar_hook
    , focusedBorderColor = "#BD93F9"
    , normalBorderColor  = "#6272A4"
    , workspaces = ["1\59285", "2\59285", "3\61948", "4\62057", "5\57879", "6\61441", "7\59285", "8\59285", "9\59138"]
    }
    `additionalKeysP`
    [ ("M-<Tab>", toggleWS)

    , ("M-t", spawn "kitty")
    , ("M-`", spawn "rofi -show run")
    , ("M-s", spawn "flameshot gui")
    , ("M-w", spawn "feh --bg-fill --randomize ~/pictures/wallpapers/")
    , ("M-p", spawn "~/.config/xmonad/toggle_picom.sh &> /dev/null &")
    , ("M-d", spawn "~/.config/xmonad/toggle_polybar.sh &> /dev/null &")

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

polybar_hook = do
    winset <- gets windowset
    title <- maybe (return "") (fmap show . getName) . W.peek $ winset
    let currWs = W.currentTag winset
    let wss = map W.tag $ W.workspaces winset

    io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
    io $ appendFile "/tmp/.xmonad-workspace-log" ("  " ++ wsStr currWs wss ++ "\n")

    where
        fmt currWs ws
            | currWs == ws = "  %{F#BD93F9}" ++ drop 1 ws ++ "  "
            | otherwise    = "  %{F#FFFFFF}" ++ drop 1 ws ++ "  "
        wsStr currWs wss = join $ map (fmt currWs) $ sortBy (compare `on` (!! 0)) wss
        

