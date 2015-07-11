import System.IO

import XMonad
import XMonad.Actions.Volume
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Util.Cursor
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)

xK_volumeDown = 0x1008ff11
xK_volumeUp = 0x1008ff13
xK_mute = 0x1008ff12
xK_brightnessDown = 0x1008ff03
xK_brightnessUp = 0x1008ff02

main = do
    xmproc <- spawnPipe "~/.xmonad/spawn-xmobar.sh"
    xmonad $ defaultConfig
        { startupHook = setDefaultCursor xC_left_ptr
        , manageHook  = composeAll
            [ manageDocks
            , isFullscreen --> doFullFloat
            , manageHook defaultConfig
            ]
        , layoutHook  = smartBorders . avoidStruts $ layoutHook defaultConfig
        , logHook     = dynamicLogString xmobarPP >>= xmonadPropLog
        , modMask     = mod4Mask
        , terminal    = "gnome-terminal"
        , focusFollowsMouse = False
        }
        `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((mod4Mask .|. shiftMask, xK_f), spawn "firefox")
        , ((0, 0x1008ff11), lowerVolume 4 >> return ()) -- Lower volume
        , ((0, 0x1008ff13), raiseVolume 4 >> return ()) -- Raise volume
        , ((0, 0x1008ff12), toggleMute >> return ()) -- Mute
        , ((0, 0x1008ff03), spawn "xbacklight -dec 4") -- Lower brightness
        , ((0, 0x1008ff02), spawn "xbacklight -inc 4") -- Raise brightness
        ]
