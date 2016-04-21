import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Util.Run
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    M.union addedKeys defaultKeys
    where
        addedKeys = M.fromList
            [ ((modMask .|. shiftMask, xK_f), spawn "firefox")
            , ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2%-")
            , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2%+")
            , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
            , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 4")
            , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 4")
            , ((modMask, xK_b), sendMessage ToggleStruts)
            ]
        defaultKeys = keys defaultConfig conf

myConfig = defaultConfig
    { manageHook = composeAll
        [ manageDocks
        , isFullscreen --> doFullFloat
        , manageHook defaultConfig
        ]
    , layoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogString xmobarPP {
            ppOutput = \_ -> return ()
        } >>= xmonadPropLog
    , modMask = mod4Mask
    , terminal = "/usr/bin/x-terminal-emulator"
    , focusFollowsMouse = False
    , keys = myKeys
    }

main = xmonad myConfig >> spawn "/usr/bin/xmobar"
